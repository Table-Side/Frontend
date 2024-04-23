import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef TokenAuthContext<
        AccessManager extends AuthenticationAccessManager<String>,
        RefreshManager extends AuthenticationRefreshManager<String, String>>
    = AuthenticationContext<AccessManager, String, RefreshManager, String>;

abstract base class AuthenticationAccessManager<AccessContext>
    with ChangeNotifier {
  AccessContext? _accessContext;

  /// Create a simple [AuthenticationAccessManager] that supplies the access
  /// token requests that must be authenticated via the 'Authorization' header
  /// of the form "Bearer <access token>".
  ///
  /// If [overrideExisting] is set to true, the access token will be injected
  /// into the request regardless of whether the request already contains a
  /// detectable access token. Otherwise, if there is already a detectable
  /// access token present, it will not be overridden.
  static bearerToken({
    String? initialAccessToken,
    bool overrideExisting = false,
  }) =>
      _SimpleBearerTokenAccessManager._(
        initialAccessToken: initialAccessToken,
        overrideExisting: overrideExisting,
      );

  /// Update the context for the [AuthenticationAccessManager]. This will
  /// contain the information necessary to authenticate the application to the
  /// service.
  ///
  /// Overriding implementations MUST call this setter too, to ensure that
  /// [notifyListeners] is called when the access token updates. So, for
  /// example, a subclass implementation might look like:
  ///
  /// ```dart
  /// @override
  /// set accessContext(String? accessToken) {
  ///   _accessToken = accessToken;
  ///   super.accessContext = accessToken;
  /// }
  /// ```
  ///
  /// Also note that you MUST set the super property AFTERWARD to ensure that
  /// your subclass has updated its internal state prior to [notifyListeners]
  /// being called.
  ///
  /// Where `_accessToken` is a private field on the subclass to ensure the
  /// token can actually be used by the subclass.
  ///
  /// Note that the setter does not actually do anything with the value provided
  /// to it, this is just the only way to enforce that [notifyListeners] be
  /// called when the setter is called without introducing ugly unintended
  /// side-effects or issues (i.e., ways for users to inadvertently bypass the
  /// setter or reliance on other classes such as the [AuthenticationContext]).
  ///
  /// To future-proof your code, ensure you pass the actual context value to
  /// this setter (as shown in the example above), rather than simply passing
  /// null.
  @mustCallSuper
  set accessContext(AccessContext? context) {
    _accessContext = context;
    notifyListeners();
  }

  /// Checks whether there is currently a valid authentication context (e.g.,
  /// if an authentication token is held that can be used to authenticate).
  /// This might return false, for example, if there is no authentication token
  /// present, it has expired, or it is malformed.
  bool get isAuthenticated;

  /// Checks whether the [accessContext] needs to be refreshed. Returns true if
  /// it should be refreshed, otherwise false. Tokens without any dedicated
  /// refresh logic (e.g., expiry implies that the user must simply log in
  /// again) should simply always return false here.
  ///
  /// If there is no current [accessContext], this will always return true.
  bool get needsRefresh;

  /// Apply headers, etc., as necessary to the specified request to authenticate
  /// the request using the access context.
  ///
  /// When invoked, it is assumed that necessary checks such as [needsRefresh]
  /// and [isAuthenticated] have already been performed, so if [isAuthenticated]
  /// is false, this will throw an exception.
  Request authenticate(final Request request);

  /// Returns a serialized version of the [context] if the [context] is not
  /// null, otherwise returns null.
  String? serialize(AccessContext? context);

  /// Deserializes the specified [rawContext] into an [AccessContext] if it is
  /// not null, otherwise returns null.
  AccessContext? deserialize(String? rawContext);
}

final class _SimpleBearerTokenAccessManager
    extends AuthenticationAccessManager<String> {
  /// The Bearer token that should be added to an 'Authorization' header of a
  /// request to indicate to the server the identity of the client's user and
  /// that this client and its user is permitted to access the resource.
  String? _accessToken;

  /// If set to true, will replace the "Authorization" header in the request,
  /// even if it already exists.
  final bool overrideExisting;

  _SimpleBearerTokenAccessManager._({
    String? initialAccessToken,
    this.overrideExisting = false,
  }) : _accessToken = initialAccessToken;

  @override
  set accessContext(String? accessToken) {
    super.accessContext = accessToken;
    _accessToken = accessToken;
  }

  @override
  bool get isAuthenticated => _accessToken != null;

  @override
  bool get needsRefresh => !isAuthenticated;

  @override
  String? serialize(String? context) => context;

  @override
  String? deserialize(String? rawContext) => rawContext;

  @override
  Request authenticate(final Request request) {
    if (_accessToken == null) {
      throw StateError(
        "Tried to authenticate, but there is no current access token",
      );
    }

    return applyHeader(
      request,
      "Authorization",
      "Bearer $_accessToken",
      override: overrideExisting,
    );
  }
}

typedef AccessTokenRefresher = Future<String> Function();

/// Default [AccessTokenRefresher] (simply throws to show that one wasn't
/// provided).
Future<String> _defaultRefresher() => throw StateError(
      "Tried to refresh access token, but no refresher was provided.",
    );

abstract base class AuthenticationRefreshManager<AccessContext, RefreshContext>
    with ChangeNotifier {
  /// Create a simple [AuthenticationRefreshManager] that uses a refresh token
  /// to request a new access token when it expires. The callback for performing
  /// a refresh is specified as a parameter.
  ///
  /// For a more complex [AuthenticationRefreshManager] (e.g., with additional
  /// logic or state), you could provide a custom implementation of the
  /// [AuthenticationRefreshManager] class.
  static token({
    String? initialRefreshToken,
    AccessTokenRefresher refresher = _defaultRefresher,
  }) =>
      _SimpleTokenRefreshManager._(
        initialRefreshToken: initialRefreshToken,
        refresher: refresher,
      );

  RefreshContext? _refreshContext;

  /// Update the context for the [AuthenticationRefreshManager]. This will
  /// contain the information necessary to refresh the authentication context.
  @mustCallSuper
  set refreshContext(RefreshContext? context) {
    _refreshContext = context;
    notifyListeners();
  }

  /// Checks whether it is possible to perform a refresh with the
  /// [AuthenticationRefreshManager]. This might return false, for example,
  /// when there is no refresh context present.
  bool get canRefresh;

  /// Performs the access token refresh, and returns the new access token
  /// afterwards.
  ///
  /// If there is no current [refreshContext], this will throw an exception.
  Future<AccessContext> refreshAccessContext();

  /// Returns a serialized version of the [context] if the [context] is not
  /// null, otherwise returns null.
  String? serialize(RefreshContext? context);

  /// Deserializes the specified [rawContext] into an [RefreshContext] if it is
  /// not null, otherwise returns null.
  RefreshContext? deserialize(String? rawContext);
}

final class _SimpleTokenRefreshManager
    extends AuthenticationRefreshManager<String, String> {
  /// The token used to refresh the access token. If this is null it indicates
  /// that either there is no active session, or the current session does not
  /// support refreshing.
  String? _refreshToken;

  /// See [AuthenticationRefreshManager.refreshAccessContext].
  final AccessTokenRefresher _refresher;

  _SimpleTokenRefreshManager._({
    String? initialRefreshToken,
    AccessTokenRefresher refresher = _defaultRefresher,
  })  : _refreshToken = initialRefreshToken,
        _refresher = refresher;

  @override
  set refreshContext(String? refreshToken) {
    _refreshToken = refreshToken;
    super.refreshContext = refreshToken;
  }

  @override
  bool get canRefresh =>
      _refreshToken != null && _refresher != _defaultRefresher;

  @override
  Future<String> refreshAccessContext() => _refresher();

  @override
  String? serialize(String? context) => context;

  @override
  String? deserialize(String? rawContext) => rawContext;
}

/// A filter that will cause authentication to be skipped if ALL of the
/// specified parameters match. Any parameters not specified will not be
/// applied.
final class SkipAuthentication {
  /// The domain/host of the request (e.g., example.com).
  final String? domain;

  /// The base of the path. (e.g., /foo would match /foo and /foo/bar).
  final String? pathBase;

  /// The entire path. (e.g., /foo would match /foo and not /foo/bar).
  /// Naturally, this will override [pathBase] if both are specified by virtue
  /// of it being more specific.
  final String? entirePath;

  const SkipAuthentication({
    this.domain,
    this.pathBase,
    this.entirePath,
  }) : assert(
          !(domain == null && pathBase == null && entirePath == null),
          "You must specify at least one filter.",
        );
}

/// A generalized [AuthenticationContext].
///
/// This holds an [AuthenticationAccessManager] which is responsible for
/// tracking the current access context and whether it needs to be refreshed,
/// and an optional [AuthenticationRefreshManager] that can perform logic to
/// refresh the access token where necessary.
///
/// This class also implements Chopper's [RequestInterceptor] interface so it
/// can be passed directly to a [ChopperClient] as an interceptor.
@immutable
class AuthenticationContext<
    AM extends AuthenticationAccessManager<A>,
    A,
    RM extends AuthenticationRefreshManager<A, R>,
    R> implements RequestInterceptor, ChangeNotifier {
  final String? storageKey;

  final AM accessManager;
  final RM? refreshManager;

  bool get hasRefreshManager => refreshManager != null;

  set accessContext(A context) => accessManager.accessContext = context;

  set refreshContext(R context) {
    if (refreshManager == null) {
      throw StateError(
        "Tried to update refresh context but there is no refresh manager.",
      );
    }
    refreshManager!.refreshContext = context;
  }

  /// A list of filters where, for each filter, if ALL of the specified
  /// parameters match the current request, the request will not have
  /// authentication applied to it.
  final List<SkipAuthentication> skipAuthenticationFilters;

  AuthenticationContext({
    this.storageKey,
    required this.accessManager,
    this.refreshManager,
    this.skipAuthenticationFilters = const [],
  }) {
    accessManager.addListener(_saveToStorage);
    refreshManager?.addListener(_saveToStorage);
  }

  Future<SharedPreferences> getStorage() => SharedPreferences.getInstance();

  Future<void> loadFromStorage() async {
    if (storageKey == null) return;
    final storage = await getStorage();

    if (refreshManager != null) {
      final refreshContext = storage.getString('$storageKey.refreshContext');
      if (refreshContext != null) {
        refreshManager!.refreshContext =
            refreshManager!.deserialize(refreshContext);
      }
    }

    final accessContext = storage.getString('$storageKey.accessContext');
    if (accessContext != null) {
      accessManager.accessContext = accessManager.deserialize(accessContext);
    }
  }

  Future<void> _saveToStorage() async {
    if (storageKey == null) return;
    final storage = await getStorage();

    if (accessManager._accessContext != null) {
      storage.setString(
        '$storageKey.accessContext',
        accessManager.serialize(accessManager._accessContext)!,
      );
    } else {
      storage.remove('$storageKey.accessContext');
    }

    if (refreshManager != null) {
      if (refreshManager!._refreshContext != null) {
        storage.setString(
          '$storageKey.refreshContext',
          refreshManager!.serialize(refreshManager!._refreshContext)!,
        );
      } else {
        storage.remove('$storageKey.refreshContext');
      }
    }
  }

  /// Clears both the refresh context and access context.
  void logout() {
    refreshManager?.refreshContext = null;
    accessManager.accessContext = null;
  }

  @override
  Future<Request> onRequest(final Request request) async {
    // First, do nothing if we don't need to authenticate for this path.
    for (final filter in skipAuthenticationFilters) {
      if ((filter.domain == null || request.uri.host == filter.domain) &&
          (filter.pathBase == null ||
              request.uri.path.startsWith(filter.pathBase!)) &&
          (filter.entirePath == null ||
              request.uri.path == filter.entirePath)) {
        return request;
      }
    }

    // If the accessManager reports that the context is out-of-date and needs
    // to be refreshed, refresh the access context if the refreshManager is
    // able to do so.
    if (refreshManager != null && accessManager.needsRefresh) {
      if (refreshManager!.canRefresh) {
        try {
          accessManager.accessContext =
              await refreshManager!.refreshAccessContext();
        } catch (ex) {
          // Log the user out if there's a failure whilst refreshing the access
          // token.
          debugPrint('Failed to refresh access token: $ex');
          accessManager.accessContext = null;
        }
      } else {
        debugPrint(
          "The access token needs to be refreshed but it can't because the refresh manager is missing a refresh token, or refresher.",
        );
        return request;
      }
    }

    // Next, if there is no access context, just leave the request as-is.
    if (!accessManager.isAuthenticated) return request;
    return accessManager.authenticate(request);
  }

  @override
  void addListener(VoidCallback listener) =>
      accessManager.addListener(listener);

  @override
  void removeListener(VoidCallback listener) =>
      accessManager.removeListener(listener);

  @override
  void dispose() {
    accessManager.dispose();
    refreshManager?.dispose();
  }

  @override
  bool get hasListeners => accessManager.hasListeners;

  /// A no-op.
  @override
  @protected
  void notifyListeners() => {};
}
