import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_side/locator.dart';
import 'package:table_side/models/api.dart';
import 'package:table_side/models/order.dart';
import 'package:table_side/network/kitchen.dart';

part 'kitchen_provider.g.dart';

/// List all orders for a restaurant
@riverpod
Future<List<Transaction>> orders(
  final OrdersRef ref,
  final String restaurantId,
) async {
  final response =
      await getApiService<KitchenService>().getAll(restaurantId: restaurantId);

  return Api.unwrapList(Transaction.fromJson, response);
}

/// Get information about a specific order
@riverpod
Future<Order> orderInfo(
  final OrderInfoRef ref,
  final String restaurantId,
  final String orderId,
) async {
  final response = await getApiService<KitchenService>().get(
    restaurantId: restaurantId,
    orderId: orderId,
  );

  return Api.unwrap(Order.fromJson, response);
}
