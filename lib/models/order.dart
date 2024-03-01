import 'dart:ffi';

class Order {
  final String id;
  final String forUser;
  final List<OrderItem> orderItem;
  final Transaction? transaction;

  Order({
    required this.id,
    required this.forUser,
    required this.orderItem,
    this.transaction,
  });
}

class OrderItem {
  final String id;
  final String itemId;
  final Int quantity;
  final String orderId;
  final Order order;

  OrderItem({
    required this.id,
    required this.itemId,
    required this.quantity,
    required this.orderId,
    required this.order,
  });
}

class Transaction {
  final String id;
  final String currency;
  final Float amount;
  final String? orderId;
  final Order? order;

  Transaction({
    required this.id,
    required this.currency,
    required this.amount,
    this.orderId,
    this.order,
  });
}
