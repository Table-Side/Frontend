// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AuthenticationService extends AuthenticationService {
  _$AuthenticationService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AuthenticationService;

  @override
  Future<Response<Map<String, dynamic>>> getCurrentUser() {
    final Uri $url = Uri.parse('${kOIDCBaseUrl}/userinfo');
    final Map<String, String> $headers = {
      'content-type': 'application/x-www-form-urlencoded',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> login({
    required String username,
    required String password,
    String clientId = kOIDCClientID,
    String clientSecret = kOIDCClientSecret,
    String grantType = 'password',
    String scope = kOIDCScope,
  }) {
    final Uri $url = Uri.parse('${kOIDCBaseUrl}/token');
    final Map<String, String> $headers = {
      'content-type': 'application/x-www-form-urlencoded',
    };
    final $body = <String, String>{
      'username': username.toString(),
      'password': password.toString(),
      'client_id': clientId.toString(),
      'client_secret': clientSecret.toString(),
      'grant_type': grantType.toString(),
      'scope': scope.toString(),
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<void>> logout() {
    final Uri $url = Uri.parse('${kOIDCBaseUrl}/');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<void, void>($request);
  }
}
