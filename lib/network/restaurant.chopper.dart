// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$RestaurantService extends RestaurantService {
  _$RestaurantService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = RestaurantService;

  @override
  Future<Response<Map<String, dynamic>>> getAll() {
    final Uri $url = Uri.parse('https://api.tableside.site/restaurants/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> get({required String id}) {
    final Uri $url = Uri.parse('https://api.tableside.site/restaurants/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> create({
    required String name,
    required String description,
  }) {
    final Uri $url = Uri.parse('https://api.tableside.site/restaurants/');
    final $body = <String, dynamic>{
      'name': name,
      'description': description,
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
    required String id,
    required String name,
    required String description,
  }) {
    final Uri $url = Uri.parse('https://api.tableside.site/restaurants/${id}');
    final $body = <String, dynamic>{
      'name': name,
      'description': description,
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
  Future<void> delete({required String id}) async {
    final Uri $url = Uri.parse('https://api.tableside.site/restaurants/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    final Response $response = await client.send<void, void>($request);
    return $response.bodyOrThrow;
  }
}
