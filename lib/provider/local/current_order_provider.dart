import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_side/locator.dart';
import 'package:table_side/models/api.dart';
import 'package:table_side/models/order.dart';
import 'package:table_side/models/restaurant.dart';
import 'package:table_side/network/order.dart';

part 'current_order_provider.g.dart';

/// Contains the current order for a (restaurant, menu) combination (family
/// provider). The order is represented as a map of item IDs to quantities.
@riverpod
class CurrentOrder extends _$CurrentOrder {
  @override
  Map<String, int> build(final String restaurant, final String menu) => {};

  /// Adds an item to the order.
  void addItem(final Item item, {final int quantity = 1}) {
    if (quantity < 1) {
      throw ArgumentError.value(quantity, 'quantity', 'must be at least 1');
    }

    state = {
      ...state,
      item.id: (state[item.id] ?? 0) + quantity,
    };
  }

  /// Removes an item from the order.
  void removeItem(final Item item) {
    if (!state.containsKey(item.id)) return;
    final newQuantity = state[item.id]! - 1;

    if (newQuantity == 0) {
      final newState = {...state};
      newState.remove(item.id);
      state = newState;
    } else {
      state = {...state, item.id: newQuantity};
    }
  }

  /// Resets the order.
  void reset() => state = {};

  Future<List> createOrder(
    String restaurantId,
    Map<String, dynamic> items,
  ) async {
    // Convert items to a list of maps
    List<Map<String, dynamic>> convertedItems = items.entries.map((entry) {
      return {
        'id': entry.key,
        'quantity': entry.value,
      };
    }).toList();

    final response = await getApiService<OrderService>()
        .createOrder(restaurantId: restaurantId, items: convertedItems);

    String id = response.body?['data']['id'];

    final response2 = await getApiService<OrderService>().checkout(orderId: id);

    List<dynamic> finalResponse = [];
    finalResponse.add(Api.unwrap(Order.fromJson, response));
    finalResponse.add(response2.statusCode);

    return finalResponse;
  }
}
