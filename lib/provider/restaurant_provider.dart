import 'dart:convert';

import 'package:chopper/src/response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_side/main.dart';
import 'package:table_side/models/api.dart';
import 'package:table_side/models/restaurant.dart';
import 'package:table_side/network/restaurants.dart';

part 'restaurant_provider.g.dart';

@riverpod
class Restaurants extends _$Restaurants {
  @override
  Future<List<RestaurantDetails>?> build() async {
    final response =
        await getApiService<RestaurantsService>().getAllRestaurants();
    print(response.body);

    return parseRestaurants(response.body!['data']);
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(build);
  }
}

List<RestaurantDetails> parseRestaurants(dynamic responseBody) {
  final parsed = (responseBody as List).cast<Map<String, dynamic>>();
  return parsed
      .map<RestaurantDetails>((json) => RestaurantDetails.fromJson(json))
      .toList();
}

// @riverpod
// Future<List<RestaurantDetails>?> getAllRestaurants(
//     final GetAllRestaurantsRef ref) async {
//   // state = const AsyncLoading();
//   // print("Fetching all restaurants...");
//
//   try {
//     final response =
//         await getApiService<RestaurantsService>().getAllRestaurants();
//
//     print(response);
//
//     if (!response.isSuccessful) {
//       print("Error fetching restaurants: ${response.error}");
//       return null;
//     }
//
//     return Api.unwrapList(extractRestaurantDetails, response)?.payload;
//
//     // List<RestaurantDetails> restaurants = extractAllRestaurants(response.body);
//
//     // print(restaurants);
//
//     // return restaurants;
//   } catch (e) {
//     print("Exception caught: $e");
//     return null;
//   }
// }
//
// List<RestaurantDetails> extractAllRestaurants(Map<String, dynamic>? response) {
//   return List<RestaurantDetails>.from(response!['data']
//       .map((restaurant) => extractRestaurantDetails(restaurant)));
// }
//
// RestaurantDetails extractRestaurantDetails(Map<String, dynamic> response) {
//   return RestaurantDetails(
//     id: response['id'],
//     name: response['name'],
//     description: response['description'],
//   );
// }
