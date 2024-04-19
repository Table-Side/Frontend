import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_side/main.dart';
import 'package:table_side/models/restaurant.dart';
import 'package:table_side/network/restaurants.dart';

part 'restaurant_provider.g.dart';

@riverpod
class Restaurants extends _$Restaurants {
  @override
  Future<List<RestaurantDetails>?> build() async {
    final response =
        await getApiService<RestaurantsService>().getAllRestaurants();
    // print(response.body);

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

// Selects the selected restaurant from the list of restaurants
@riverpod
Future<RestaurantDetails> restaurantInfo(
    final RestaurantInfoRef ref, final String restaurantId) async {
  return await ref.watch(restaurantsProvider.selectAsync((final value) => value!
      .where(
          (final RestaurantDetails restaurant) => restaurant.id == restaurantId)
      .first));
}
