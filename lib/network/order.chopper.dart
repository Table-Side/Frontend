// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$OrderService extends OrderService {
  _$OrderService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = OrderService;

  @override
  Future<Response<Map<String, dynamic>>> createOrder({
    required String restaurantId,
    required List<Map<String, dynamic>> items,
  }) {
    final Uri $url = Uri.parse('https://api.tableside.site/orders/');
    final $body = <String, dynamic>{
      'restaurantId': restaurantId,
      'items': items,
    };
    final Request $request = Request(
      'POST',
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
  Future<Response<Map<String, dynamic>>> checkout({required String orderId}) {
    final Uri $url =
        Uri.parse('https://api.tableside.site/orders/${orderId}/checkout');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
