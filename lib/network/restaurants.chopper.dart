// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurants.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$RestaurantsService extends RestaurantsService {
  _$RestaurantsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = RestaurantsService;

  @override
  Future<Response<Map<String, dynamic>>> getAllRestaurants() {
    final Uri $url = Uri.parse('https://api.tableside.site/restaurants/all');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Referrer-Policy': 'no-referrer',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
