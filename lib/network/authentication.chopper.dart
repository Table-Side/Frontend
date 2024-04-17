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
  Future<Response<Map<String, dynamic>>> getCurrentUser(String accessToken) {
    final Uri $url = Uri.parse(
        'https://auth.tableside.site/realms/Tableside/protocol/openid-connect/userinfo');
    final Map<String, String> $headers = {
      'Authorization': accessToken,
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
  Future<Response<Map<String, dynamic>>> login(Map<String, String> fields) {
    final Uri $url = Uri.parse(
        'https://auth.tableside.site/realms/Tableside/protocol/openid-connect/token');
    final Map<String, String> $headers = {
      'content-type': 'application/x-www-form-urlencoded',
    };
    final $body = fields;
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
    final Uri $url =
        Uri.parse('https://auth.tableside.site/realms/Tableside/logout');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<void, void>($request);
  }
}
