import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_side/locator.dart';
import 'package:table_side/models/api.dart';
import 'package:table_side/models/account.dart';
import 'package:table_side/network/authentication.dart';

part 'authentication_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  static get _auth => getApiAuthenticator();

  Account? _getAuthState() {
    final payload = _auth.accessManager.payload;

    if (payload == null) return null;
    return Account(
      id: payload['sub'],
      email: payload['email'],
      name: payload['name'],
      roles: payload['realm_access']['roles']?.cast<String>() ?? [],
    );
  }

  @override
  Future<Account?> build() async {
    _auth.addListener(_onAuthStateChange);
    ref.onDispose(() {
      _auth.removeListener(_onAuthStateChange);
    });

    return _getAuthState();
  }

  void _onAuthStateChange() => state = AsyncData(_getAuthState());

  /// Uses [AuthenticationService.getCurrentUser] to refresh the user details.
  Future<void> refreshAccountDetails() async {
    final response =
        await getApiService<AuthenticationService>().getCurrentUser();

    if (response.isSuccessful) {
      state = AsyncData(Api.unwrap(Account.fromJson, response)!);
    } else {
      state = AsyncError(
        Exception('Failed to refresh user details.'),
        StackTrace.current,
      );
    }
  }

  Future<void> login({
    required final String email,
    required final String password,
  }) async {
    state = const AsyncLoading();
    debugPrint("Performing login...");

    final response = await getApiService<AuthenticationService>().login(
      username: email,
      password: password,
    );

    if (!response.isSuccessful) {
      debugPrint("Error logging in: ${response.error}");
      state = AsyncError(
        response.error ?? Exception('Failed to login.'),
        StackTrace.current,
      );
      return;
    }

    if (response.body != null &&
        response.body!['access_token'] != null &&
        response.body!['refresh_token'] != null) {
      debugPrint("Response from auth system has refresh and access tokens.");
      String refreshToken = response.body!['refresh_token'];
      _auth.refreshContext = refreshToken;

      String accessToken = response.body!['access_token'];
      _auth.accessContext = accessToken;
      debugPrint("Established user.");
    } else {
      state = AsyncError(
        response.error ?? Exception('Invalid response to login request.'),
        StackTrace.current,
      );
    }
  }

  // Logout
  void logout() {
    _auth.logout();
  }
}

@riverpod
AsyncValue<bool> isAuthenticated(final IsAuthenticatedRef ref) {
  final currentUser = ref.watch(authenticationProvider);
  if (currentUser.hasError) return const AsyncData(false);
  if (currentUser.isLoading) return const AsyncLoading();
  return AsyncData(currentUser.value != null);
}
