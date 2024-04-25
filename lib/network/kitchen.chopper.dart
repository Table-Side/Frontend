// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kitchen.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$KitchenService extends KitchenService {
  _$KitchenService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = KitchenService;

  @override
  Future<Response<Map<String, dynamic>>> getAll(
      {required String restaurantId}) {
    final Uri $url =
        Uri.parse('https://api.tableside.site/kitchen/${restaurantId}');
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
    required String orderId,
  }) {
    final Uri $url = Uri.parse(
        'https://api.tableside.site/kitchen/${restaurantId}/${orderId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> finish({
    required String restaurantId,
    required String orderId,
  }) {
    final Uri $url = Uri.parse(
        'https://api.tableside.site/kitchen/${restaurantId}/${orderId}/finish');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
