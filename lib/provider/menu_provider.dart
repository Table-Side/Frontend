import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_side/locator.dart';
import 'package:table_side/models/api.dart';
import 'package:table_side/models/restaurant.dart';
import 'package:table_side/network/menu.dart';

part 'menu_provider.g.dart';

/// List all menus for a restaurant
@riverpod
Future<List<Menu>> menus(
  final MenusRef ref,
  final String restaurantId,
) async {
  final response =
      await getApiService<MenuService>().getAll(restaurantId: restaurantId);

  return Api.unwrapList(Menu.fromJson, response);
}

/// Get information about a specific menu
@riverpod
Future<Menu> menuInfo(
  final MenuInfoRef ref,
  final String restaurantId,
  final String menuId,
) async {
  final response = await getApiService<MenuService>().get(
    restaurantId: restaurantId,
    menuId: menuId,
  );

  return Api.unwrap(Menu.fromJson, response);
}
