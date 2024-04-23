import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'auth_context_interceptor.dart';

final class OidcJwtRefreshManager
    extends AuthenticationRefreshManager<String, String> {
  /// The OIDC (OpenID Connect) base URL.
  final String baseUrl;

  final String clientId;
  final String _clientSecret;

  final String scope;

  String? _refreshToken;

  OidcJwtRefreshManager({
    required this.baseUrl,
    required this.clientId,
    required final String clientSecret,
    required this.scope,
    final String? initialRefreshToken,
  })  : _refreshToken = initialRefreshToken,
        _clientSecret = clientSecret;

  @override
  bool get canRefresh => _refreshToken != null;

  @override
  set refreshContext(final String? refreshToken) {
    _refreshToken = refreshToken;
    super.refreshContext = refreshToken;
  }

  @override
  String? serialize(String? context) => context;

  @override
  String? deserialize(String? rawContext) => rawContext;

  @override
  Future<String> refreshAccessContext() async {
    debugPrint("Refreshing access token...");

    final Client client = Client();
    final response = await client.post(
      Uri.parse('$baseUrl/token'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: <String, String>{
        'client_id': clientId.toString(),
        'client_secret': _clientSecret.toString(),
        'grant_type': 'refresh_token',
        'refresh_token': _refreshToken!,
        'scope': scope.toString(),
      },
    );

    if (response.body.isEmpty) {
      throw Exception("Empty response whilst obtaining refresh token");
    }

    final body = jsonDecode(response.body);
    if (body['access_token'] == null || body['refresh_token'] == null) {
      throw Exception("Invalid response whilst obtaining refresh token");
    }

    debugPrint("Access token refreshed at ${DateTime.now()}.");
    _refreshToken = body['refresh_token'];
    return body['access_token'];
  }
}
