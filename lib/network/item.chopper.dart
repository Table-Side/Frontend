// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ItemService extends ItemService {
  _$ItemService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ItemService;

  @override
  Future<Response<Map<String, dynamic>>> getAll({
    required String restaurantId,
    required String menuId,
  }) {
    final Uri $url = Uri.parse(
        'https://api.tableside.site/restaurants/${restaurantId}/menus/${menuId}/items');
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
    required String menuId,
    required String displayName,
    required String shortName,
    required String description,
    required String price,
  }) {
    final Uri $url = Uri.parse(
        'https://api.tableside.site/restaurants/${restaurantId}/menus/${menuId}/items');
    final $body = <String, dynamic>{
      'displayName': displayName,
      'shortName': shortName,
      'description': description,
      'price': price,
    };
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
    required String itemId,
    required String displayName,
    required String shortName,
    required String description,
    required String price,
  }) {
    final Uri $url = Uri.parse(
        'https://api.tableside.site/restaurants/${restaurantId}/menus/${menuId}/items/${itemId}');
    final $body = <String, dynamic>{
      'displayName': displayName,
      'shortName': shortName,
      'description': description,
      'price': price,
    };
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
  Future<Response<Map<String, dynamic>>> setAvailability({
    required String restaurantId,
    required String menuId,
    required String itemId,
    required bool isAvailable,
  }) {
    final Uri $url = Uri.parse(
        'https://api.tableside.site/restaurants/${restaurantId}/menus/${menuId}/items/${itemId}/availability');
    final $body = <String, dynamic>{'isAvailable': isAvailable};
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
    required String itemId,
  }) async {
    final Uri $url = Uri.parse(
        'https://api.tableside.site/restaurants/${restaurantId}/menus/${menuId}/items/${itemId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    final Response $response = await client.send<void, void>($request);
    return $response.bodyOrThrow;
  }
}
