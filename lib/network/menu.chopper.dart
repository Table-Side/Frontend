// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MenuService extends MenuService {
  _$MenuService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MenuService;

  @override
  Future<Response<Map<String, dynamic>>> getAll(
      {required String restaurantId}) {
    final Uri $url = Uri.parse(
        'https://api.tableside.site/restaurants/${restaurantId}/menus');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> get({
    required String restaurantId,
    required String menuId,
  }) {
    final Uri $url = Uri.parse(
        'https://api.tableside.site/restaurants/${restaurantId}/menus/${menuId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> create({
    required String restaurantId,
    required String name,
  }) {
    final Uri $url = Uri.parse(
        'https://api.tableside.site/restaurants/${restaurantId}/menus');
    final $body = <String, dynamic>{'name': name};
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>(
      $request,
      requestConverter: JsonConverter.requestFactory,
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> update({
    required String restaurantId,
    required String menuId,
    required String name,
  }) {
    final Uri $url = Uri.parse(
        'https://api.tableside.site/restaurants/${restaurantId}/menus/${menuId}');
    final $body = <String, dynamic>{'name': name};
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>(
      $request,
      requestConverter: JsonConverter.requestFactory,
    );
  }

  @override
  Future<void> delete({
    required String restaurantId,
    required String menuId,
  }) async {
    final Uri $url = Uri.parse(
        'https://api.tableside.site/restaurants/${restaurantId}/menus/${menuId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    final Response $response = await client.send<void, void>($request);
    return $response.bodyOrThrow;
  }
}
