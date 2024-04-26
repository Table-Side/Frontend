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

@immutable
@freezed
class CheckoutOrder with _$CheckoutOrder {
  const factory CheckoutOrder({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String forUser,
    required String forRestaurant,
    required List<CheckoutOrderItem> items,
    CheckoutTransaction? transaction,
  }) = _CheckoutOrder;

  factory CheckoutOrder.fromJson(final Map<String, dynamic> json) =>
      _$CheckoutOrderFromJson(json);
}

@immutable
@freezed
class CheckoutOrderItem with _$CheckoutOrderItem {
  const factory CheckoutOrderItem({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String itemId,
    required int quantity,
    required String price,
    required String orderId,
  }) = _CheckoutOrderItem;

  factory CheckoutOrderItem.fromJson(final Map<String, dynamic> json) =>
      _$CheckoutOrderItemFromJson(json);
}

@immutable
@freezed
class CheckoutTransaction with _$CheckoutTransaction {
  const factory CheckoutTransaction({
    required String id,
    required DateTime createdAt,
    required String currency,
    required double amount,
    required String orderId,
  }) = _CheckoutTransaction;

  factory CheckoutTransaction.fromJson(final Map<String, dynamic> json) =>
      _$CheckoutTransactionFromJson(json);
}
