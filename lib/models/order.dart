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
  const factory OrderItem({
    required String id,
    required String itemId,
    required int quantity,
    required String orderId,
  }) = _OrderItem;

  factory OrderItem.fromJson(final Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

// class Order {
//   final String id;
//   final String forUser;
//   final List<OrderItem> orderItem;
//   final Transaction? transaction;
//
//   Order({
//     required this.id,
//     required this.forUser,
//     required this.orderItem,
//     this.transaction,
//   });
// }
//
// class OrderItem {
//   final String id;
//   final String itemId;
//   final Int quantity;
//   final String orderId;
//   final Order order;
//
//   OrderItem({
//     required this.id,
//     required this.itemId,
//     required this.quantity,
//     required this.orderId,
//     required this.order,
//   });
// }
//
// class Transaction {
//   final String id;
//   final String currency;
//   final Float amount;
//   final String? orderId;
//   final Order? order;
//
//   Transaction({
//     required this.id,
//     required this.currency,
//     required this.amount,
//     this.orderId,
//     this.order,
//   });
// }
