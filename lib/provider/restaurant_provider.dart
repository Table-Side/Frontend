import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_side/locator.dart';
import 'package:table_side/models/api.dart';
import 'package:table_side/models/restaurant.dart';
import 'package:table_side/network/restaurant.dart';
import 'package:table_side/network/user.dart';

part 'restaurant_provider.g.dart';

@riverpod
Future<List<Restaurant>> restaurants(final RestaurantsRef ref) async {
  final response = await getApiService<RestaurantService>().getAll();
  return Api.unwrapList(Restaurant.fromJson, response);
}

/// Selects the selected restaurant from the list of restaurants
@riverpod
Future<Restaurant> restaurantInfo(
  final RestaurantInfoRef ref,
  final String restaurantId,
) async {
  return await ref.watch(restaurantsProvider.selectAsync((final value) => value
      .where((final Restaurant restaurant) => restaurant.id == restaurantId)
      .first));
}

/// Gets the list of restaurants owned by the user
@riverpod
Future<List<Restaurant>> ownedRestaurants(final OwnedRestaurantsRef ref) async {
  final response = await getApiService<UserService>().ownedRestaurants();
  return Api.unwrapList(Restaurant.fromJson, response);
}

/// Gets the primary owned restaurant of the user
@riverpod
AsyncValue<Restaurant?> primaryOwnedRestaurant(
    final PrimaryOwnedRestaurantRef ref) {
  return ref.watch(ownedRestaurantsProvider).when(
        data: (restaurants) {
          restaurants.sort((a, b) => a.createdAt.compareTo(b.createdAt));
          return AsyncData(restaurants.firstOrNull);
        },
        error: (error, stackTrace) => AsyncError(error, stackTrace),
        loading: () => const AsyncLoading(),
      );
}
