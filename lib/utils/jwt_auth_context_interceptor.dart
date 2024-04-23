import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:table_side/utils/auth_context_interceptor.dart';

typedef JwtAuthContext = TokenAuthContext<JwtBearerTokenAccessManager,
    AuthenticationRefreshManager<String, String>>;

@immutable
final class JsonWebToken {
  final String token;
  final DateTime issuedAt;
  final DateTime expiry;
  final Map<String, dynamic> payload;

  /// Returns true if the [expiry] date/time is after the current date/time.
  bool get hasExpired => DateTime.now().isAfter(expiry);

  const JsonWebToken._({
    required this.token,
    required this.issuedAt,
    required this.expiry,
    required this.payload,
  });

  /// Parse a [JsonWebToken] object from a raw [token] string.
  static JsonWebToken? parse(final String? token) {
    if (token == null) return null;
    final payload = _extractEntirePayload(token);

    return JsonWebToken._(
      token: token,
      issuedAt: _extractIssuedAt(payload),
      expiry: _extractExpiry(payload),
      payload: _extractPayload(payload),
    );
  }

  /// Extracts the entire JWT payload from the given JWT token.
  static Map<String, dynamic> _extractEntirePayload(String token) {
    List<String> parts = token.split('.');
    String normalizedPayload = parts[1] + '=' * (4 - (parts[1].length % 4));
    return json.decode(utf8.decode(base64Url.decode(normalizedPayload)));
  }

  /// Load the issued-at dat/time from 'iat'; the number of seconds elapsed
  /// since the UNIX epoch, representing the date and time, at which the JWT
  /// was issued.
  static DateTime extractIssuedAt(String token) =>
      _extractIssuedAt(_extractEntirePayload(token));

  static DateTime _extractIssuedAt(final Map<String, dynamic> payload) =>
      DateTime.fromMillisecondsSinceEpoch((payload['iat']! as int) * 1000);

  /// Load the expiry date/time from 'exp'; the number of seconds elapsed since
  /// UNIX epoch, representing the date and time, at which the JWT expires.
  static DateTime extractExpiry(String token) =>
      _extractExpiry(_extractEntirePayload(token));

  static DateTime _extractExpiry(final Map<String, dynamic> payload) =>
      DateTime.fromMillisecondsSinceEpoch((payload['exp']! as int) * 1000);

  /// Extracts all additional (non-standard) parameters from the JWT payload.
  static Map<String, dynamic> extractPayload(String token) =>
      _extractPayload(_extractEntirePayload(token));

  static Map<String, dynamic> _extractPayload(
      final Map<String, dynamic> payload) {
    final extractedPayload = <String, dynamic>{};

    for (String key in payload.keys.where((key) =>
        !['access_token', 'refresh_token', 'iat', 'exp'].contains(key))) {
      extractedPayload[key] = payload[key];
    }

    return extractedPayload;
  }

  @override
  String toString() {
    return 'JsonWebToken {\n'
        '  <raw token redacted>\n'
        '  issuedAt = $issuedAt\n'
        '  expiry = $expiry\n'
        '  payload <partially redacted> = $payload\n'
        '}';
  }
}

final class JwtBearerTokenAccessManager
    extends AuthenticationAccessManager<String> {
  /// The Bearer token that should be added to an 'Authorization' header of a
  /// request to indicate to the server the identity of the client's user and
  /// that this client and its user is permitted to access the resource.
  JsonWebToken? _accessToken;

  /// Any additional, non-standard, parameters specified in the JSON Web Token.
  Map<String, dynamic>? get payload => _accessToken?.payload;

  /// The expiry date of the JSON Web Token.
  DateTime? get expiry => _accessToken?.expiry;

  /// If set to true, will replace the "Authorization" header in the request,
  /// even if it already exists.
  final bool overrideExisting;

  JwtBearerTokenAccessManager({
    String? initialAccessToken,
    this.overrideExisting = false,
  }) : _accessToken = JsonWebToken.parse(initialAccessToken);

  @override
  set accessContext(String? accessToken) {
    _accessToken = JsonWebToken.parse(accessToken);
    super.accessContext = accessToken;
  }

  /// A sugar for [accessContext].
  set accessToken(String? accessToken) => accessContext = accessToken;

  @override
  bool get isAuthenticated => _accessToken != null;

  @override
  bool get needsRefresh => _accessToken?.hasExpired ?? true;

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
      "Bearer ${_accessToken!.token}",
      override: overrideExisting,
    );
  }
}
