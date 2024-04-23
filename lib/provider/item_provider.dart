import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_side/locator.dart';
import 'package:table_side/models/api.dart';
import 'package:table_side/models/restaurant.dart';
import 'package:table_side/network/item.dart';

part 'item_provider.g.dart';

/// List all items for a menu
@riverpod
Future<List<Item>> items(
    final ItemsRef ref, final String restaurantId, final String menuId) async {
  final response = await getApiService<ItemService>()
      .getAll(restaurantId: restaurantId, menuId: menuId);
  return Api.unwrapList(Item.fromJson, response);
}
