import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@immutable
@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String forUser,
    required String forRestaurant,
    required List<OrderItem> items,
  }) = _Order;

  factory Order.fromJson(final Map<String, dynamic> json) =>
      _$OrderFromJson(json);
}

@immutable
@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem(
      {required String id,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String prettyName,
      required String shortName,
      required int quantity,
      required String kitchenOrderId}) = _OrderItem;

  factory OrderItem.fromJson(final Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@immutable
@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String restaurantId,
    required String orderId,
    required String userId,
    required List<OrderItem> items,
  }) = _Transaction;

  factory Transaction.fromJson(final Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
