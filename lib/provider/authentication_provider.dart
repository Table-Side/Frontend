import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_side/main.dart';
import 'package:table_side/models/api.dart';
import 'package:table_side/models/user.dart';
import 'package:table_side/models/session.dart';
import 'package:table_side/models/user_details.dart';
import 'package:table_side/network/authentication.dart';

part 'authentication_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  // Private constructor
  Authentication._();

  // Factory constructor
  factory Authentication() => _instance;

  // Singleton instance
  static final Authentication _instance = Authentication._();

  // Getter to access the singleton instance
  static Authentication get instance => _instance;

  @override
  Future<User?> build() async {
    return null;
  }

  User? currentUser;

  UserDetails? getCurrentUserDetails() {
    return currentUser?.user;
  }

  Session? getCurrentSession() {
    return currentUser?.session;
  }

  Future<Session?> refreshSession() {
    // Todo: Implement refresh token logic
    // Fixme: Sam, this is for you :)
    return Future.value(null);
  }

  Future<void> login({
    required final String email,
    required final String password,
    required String clientId,
    required String grantType,
    required String scope,
    required String clientSecret,
  }) async {
    state = const AsyncLoading();
    print("Performing login...");

    final response = await getApiService<AuthenticationService>().login({
      "username": email,
      "password": password,
      "client_id": clientId,
      "grant_type": grantType,
      "scope": scope,
      "client_secret": clientSecret
    });

    if (!response.isSuccessful) {
      print("Error logging in: ${response.error}");
    }

    if (response.body?['access_token'] != null) {
      print("Response from auth system has access token.");

      String accessToken = response.body!['access_token'];
      String refreshToken = response.body!['refresh_token'];

      Map<String, dynamic> payload = extractJWTPayload(accessToken);

      UserDetails user = extractUserDetails(payload);
      Session userSession =
          extractSessionDetails(accessToken, refreshToken, payload);
      currentUser = User(
        user: user,
        session: userSession,
      );
      print("Established user.");

      // Set the state of the Authentication provider to the currentUser instance
      state = AsyncData(currentUser);

      return;
    } else {
      return;
    }
  }

  Map<String, dynamic> extractJWTPayload(String jwt) {
    List<String> parts = jwt.split('.');
    String encodedPayload = parts[1];
    while (encodedPayload.length % 4 != 0) {
      encodedPayload += '=';
    }
    String decodedPayload = utf8.decode(base64Url.decode(encodedPayload));
    return json.decode(decodedPayload);
  }

  UserDetails extractUserDetails(Map<String, dynamic> jwtPayload) {
    return UserDetails(
        id: jwtPayload['sub'],
        email: jwtPayload['email'],
        name: jwtPayload['name'],
        roles: jwtPayload['realm_access']['roles'] != null
            ? List<String>.from(jwtPayload['realm_access']['roles'])
            : []);
  }

  Session extractSessionDetails(
      String access, String refresh, Map<String, dynamic> jwtPayload) {
    return Session(
      accessToken: access,
      refreshToken: refresh,
      iat: jwtPayload['iat'],
      exp: jwtPayload['exp'],
    );
  }

  // Logout
  Future<void> logout() async {
    state = const AsyncLoading();
    await getApiService<AuthenticationService>().logout();
    // await writeToStorage(null);
    state = const AsyncData(null);
  }

  // static Future<void> writeToStorage(final User? user) async {
  //   if (user != null) {
  //     await storage.write(
  //       key: "user",
  //       value: jsonEncode(user.toJson()),
  //     );
  //   } else {
  //     await storage.delete(key: "user");
  //   }
  // }

  // Read the current user from storage
//   static Future<User?> readFromStorage() async {
//     final String? userString = await storage.read(key: "user");
//
//     if (userString == null) {
//       return null;
//     }
//
//     final userMap = jsonDecode(userString) as Map<String, dynamic>;
//     return User.fromJson(userMap);
//   }
}

@riverpod
AsyncValue<bool> isAuthenticated(final IsAuthenticatedRef ref) {
  final currentUser = ref.watch(authenticationProvider);

  // print(currentUser);

  if (currentUser.hasError) return const AsyncData(false);
  if (currentUser.isLoading) return const AsyncLoading();
  return AsyncData(currentUser.value != null);
}
