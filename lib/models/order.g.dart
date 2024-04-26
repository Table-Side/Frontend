// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String,
      forUser: json['forUser'] as String,
      forRestaurant: json['forRestaurant'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'forUser': instance.forUser,
      'forRestaurant': instance.forRestaurant,
      'items': instance.items,
    };

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      prettyName: json['prettyName'] as String,
      shortName: json['shortName'] as String,
      quantity: json['quantity'] as int,
      kitchenOrderId: json['kitchenOrderId'] as String,
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'prettyName': instance.prettyName,
      'shortName': instance.shortName,
      'quantity': instance.quantity,
      'kitchenOrderId': instance.kitchenOrderId,
    };

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      restaurantId: json['restaurantId'] as String,
      orderId: json['orderId'] as String,
      userId: json['userId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'restaurantId': instance.restaurantId,
      'orderId': instance.orderId,
      'userId': instance.userId,
      'items': instance.items,
    };

_$CheckoutOrderImpl _$$CheckoutOrderImplFromJson(Map<String, dynamic> json) =>
    _$CheckoutOrderImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      forUser: json['forUser'] as String,
      forRestaurant: json['forRestaurant'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => CheckoutOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      transaction: json['transaction'] == null
          ? null
          : CheckoutTransaction.fromJson(
              json['transaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CheckoutOrderImplToJson(_$CheckoutOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'forUser': instance.forUser,
      'forRestaurant': instance.forRestaurant,
      'items': instance.items,
      'transaction': instance.transaction,
    };

_$CheckoutOrderItemImpl _$$CheckoutOrderItemImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckoutOrderItemImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      itemId: json['itemId'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as String,
      orderId: json['orderId'] as String,
    );

Map<String, dynamic> _$$CheckoutOrderItemImplToJson(
        _$CheckoutOrderItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'itemId': instance.itemId,
      'quantity': instance.quantity,
      'price': instance.price,
      'orderId': instance.orderId,
    };

_$CheckoutTransactionImpl _$$CheckoutTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckoutTransactionImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      currency: json['currency'] as String,
      amount: (json['amount'] as num).toDouble(),
      orderId: json['orderId'] as String,
    );

Map<String, dynamic> _$$CheckoutTransactionImplToJson(
        _$CheckoutTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'currency': instance.currency,
      'amount': instance.amount,
      'orderId': instance.orderId,
    };
