// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get id => throw _privateConstructorUsedError;
  String get forUser => throw _privateConstructorUsedError;
  String get forRestaurant => throw _privateConstructorUsedError;
  List<OrderItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String id, String forUser, String forRestaurant, List<OrderItem> items});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? forUser = null,
    Object? forRestaurant = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      forUser: null == forUser
          ? _value.forUser
          : forUser // ignore: cast_nullable_to_non_nullable
              as String,
      forRestaurant: null == forRestaurant
          ? _value.forRestaurant
          : forRestaurant // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String forUser, String forRestaurant, List<OrderItem> items});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? forUser = null,
    Object? forRestaurant = null,
    Object? items = null,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      forUser: null == forUser
          ? _value.forUser
          : forUser // ignore: cast_nullable_to_non_nullable
              as String,
      forRestaurant: null == forRestaurant
          ? _value.forRestaurant
          : forRestaurant // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.id,
      required this.forUser,
      required this.forRestaurant,
      required final List<OrderItem> items})
      : _items = items;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String id;
  @override
  final String forUser;
  @override
  final String forRestaurant;
  final List<OrderItem> _items;
  @override
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Order(id: $id, forUser: $forUser, forRestaurant: $forRestaurant, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.forUser, forUser) || other.forUser == forUser) &&
            (identical(other.forRestaurant, forRestaurant) ||
                other.forRestaurant == forRestaurant) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, forUser, forRestaurant,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required final String id,
      required final String forUser,
      required final String forRestaurant,
      required final List<OrderItem> items}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get id;
  @override
  String get forUser;
  @override
  String get forRestaurant;
  @override
  List<OrderItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get prettyName => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get kitchenOrderId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String prettyName,
      String shortName,
      int quantity,
      String kitchenOrderId});
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? prettyName = null,
    Object? shortName = null,
    Object? quantity = null,
    Object? kitchenOrderId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prettyName: null == prettyName
          ? _value.prettyName
          : prettyName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      kitchenOrderId: null == kitchenOrderId
          ? _value.kitchenOrderId
          : kitchenOrderId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
          _$OrderItemImpl value, $Res Function(_$OrderItemImpl) then) =
      __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String prettyName,
      String shortName,
      int quantity,
      String kitchenOrderId});
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
      _$OrderItemImpl _value, $Res Function(_$OrderItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? prettyName = null,
    Object? shortName = null,
    Object? quantity = null,
    Object? kitchenOrderId = null,
  }) {
    return _then(_$OrderItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prettyName: null == prettyName
          ? _value.prettyName
          : prettyName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      kitchenOrderId: null == kitchenOrderId
          ? _value.kitchenOrderId
          : kitchenOrderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemImpl implements _OrderItem {
  const _$OrderItemImpl(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.prettyName,
      required this.shortName,
      required this.quantity,
      required this.kitchenOrderId});

  factory _$OrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String prettyName;
  @override
  final String shortName;
  @override
  final int quantity;
  @override
  final String kitchenOrderId;

  @override
  String toString() {
    return 'OrderItem(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, prettyName: $prettyName, shortName: $shortName, quantity: $quantity, kitchenOrderId: $kitchenOrderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.prettyName, prettyName) ||
                other.prettyName == prettyName) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.kitchenOrderId, kitchenOrderId) ||
                other.kitchenOrderId == kitchenOrderId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt,
      prettyName, shortName, quantity, kitchenOrderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemImplToJson(
      this,
    );
  }
}

abstract class _OrderItem implements OrderItem {
  const factory _OrderItem(
      {required final String id,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String prettyName,
      required final String shortName,
      required final int quantity,
      required final String kitchenOrderId}) = _$OrderItemImpl;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$OrderItemImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get prettyName;
  @override
  String get shortName;
  @override
  int get quantity;
  @override
  String get kitchenOrderId;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<OrderItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String restaurantId,
      String orderId,
      String userId,
      List<OrderItem> items});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? restaurantId = null,
    Object? orderId = null,
    Object? userId = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String restaurantId,
      String orderId,
      String userId,
      List<OrderItem> items});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? restaurantId = null,
    Object? orderId = null,
    Object? userId = null,
    Object? items = null,
  }) {
    return _then(_$TransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl implements _Transaction {
  const _$TransactionImpl(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.restaurantId,
      required this.orderId,
      required this.userId,
      required final List<OrderItem> items})
      : _items = items;

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String restaurantId;
  @override
  final String orderId;
  @override
  final String userId;
  final List<OrderItem> _items;
  @override
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Transaction(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, restaurantId: $restaurantId, orderId: $orderId, userId: $userId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      restaurantId,
      orderId,
      userId,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {required final String id,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String restaurantId,
      required final String orderId,
      required final String userId,
      required final List<OrderItem> items}) = _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get restaurantId;
  @override
  String get orderId;
  @override
  String get userId;
  @override
  List<OrderItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckoutOrder _$CheckoutOrderFromJson(Map<String, dynamic> json) {
  return _CheckoutOrder.fromJson(json);
}

/// @nodoc
mixin _$CheckoutOrder {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get forUser => throw _privateConstructorUsedError;
  String get forRestaurant => throw _privateConstructorUsedError;
  List<CheckoutOrderItem> get items => throw _privateConstructorUsedError;
  CheckoutTransaction? get transaction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckoutOrderCopyWith<CheckoutOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutOrderCopyWith<$Res> {
  factory $CheckoutOrderCopyWith(
          CheckoutOrder value, $Res Function(CheckoutOrder) then) =
      _$CheckoutOrderCopyWithImpl<$Res, CheckoutOrder>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String forUser,
      String forRestaurant,
      List<CheckoutOrderItem> items,
      CheckoutTransaction? transaction});

  $CheckoutTransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class _$CheckoutOrderCopyWithImpl<$Res, $Val extends CheckoutOrder>
    implements $CheckoutOrderCopyWith<$Res> {
  _$CheckoutOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? forUser = null,
    Object? forRestaurant = null,
    Object? items = null,
    Object? transaction = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      forUser: null == forUser
          ? _value.forUser
          : forUser // ignore: cast_nullable_to_non_nullable
              as String,
      forRestaurant: null == forRestaurant
          ? _value.forRestaurant
          : forRestaurant // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CheckoutOrderItem>,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as CheckoutTransaction?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CheckoutTransactionCopyWith<$Res>? get transaction {
    if (_value.transaction == null) {
      return null;
    }

    return $CheckoutTransactionCopyWith<$Res>(_value.transaction!, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckoutOrderImplCopyWith<$Res>
    implements $CheckoutOrderCopyWith<$Res> {
  factory _$$CheckoutOrderImplCopyWith(
          _$CheckoutOrderImpl value, $Res Function(_$CheckoutOrderImpl) then) =
      __$$CheckoutOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String forUser,
      String forRestaurant,
      List<CheckoutOrderItem> items,
      CheckoutTransaction? transaction});

  @override
  $CheckoutTransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class __$$CheckoutOrderImplCopyWithImpl<$Res>
    extends _$CheckoutOrderCopyWithImpl<$Res, _$CheckoutOrderImpl>
    implements _$$CheckoutOrderImplCopyWith<$Res> {
  __$$CheckoutOrderImplCopyWithImpl(
      _$CheckoutOrderImpl _value, $Res Function(_$CheckoutOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? forUser = null,
    Object? forRestaurant = null,
    Object? items = null,
    Object? transaction = freezed,
  }) {
    return _then(_$CheckoutOrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      forUser: null == forUser
          ? _value.forUser
          : forUser // ignore: cast_nullable_to_non_nullable
              as String,
      forRestaurant: null == forRestaurant
          ? _value.forRestaurant
          : forRestaurant // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CheckoutOrderItem>,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as CheckoutTransaction?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckoutOrderImpl implements _CheckoutOrder {
  const _$CheckoutOrderImpl(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.forUser,
      required this.forRestaurant,
      required final List<CheckoutOrderItem> items,
      this.transaction})
      : _items = items;

  factory _$CheckoutOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutOrderImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String forUser;
  @override
  final String forRestaurant;
  final List<CheckoutOrderItem> _items;
  @override
  List<CheckoutOrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final CheckoutTransaction? transaction;

  @override
  String toString() {
    return 'CheckoutOrder(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, forUser: $forUser, forRestaurant: $forRestaurant, items: $items, transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.forUser, forUser) || other.forUser == forUser) &&
            (identical(other.forRestaurant, forRestaurant) ||
                other.forRestaurant == forRestaurant) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      forUser,
      forRestaurant,
      const DeepCollectionEquality().hash(_items),
      transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutOrderImplCopyWith<_$CheckoutOrderImpl> get copyWith =>
      __$$CheckoutOrderImplCopyWithImpl<_$CheckoutOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutOrderImplToJson(
      this,
    );
  }
}

abstract class _CheckoutOrder implements CheckoutOrder {
  const factory _CheckoutOrder(
      {required final String id,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String forUser,
      required final String forRestaurant,
      required final List<CheckoutOrderItem> items,
      final CheckoutTransaction? transaction}) = _$CheckoutOrderImpl;

  factory _CheckoutOrder.fromJson(Map<String, dynamic> json) =
      _$CheckoutOrderImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get forUser;
  @override
  String get forRestaurant;
  @override
  List<CheckoutOrderItem> get items;
  @override
  CheckoutTransaction? get transaction;
  @override
  @JsonKey(ignore: true)
  _$$CheckoutOrderImplCopyWith<_$CheckoutOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckoutOrderItem _$CheckoutOrderItemFromJson(Map<String, dynamic> json) {
  return _CheckoutOrderItem.fromJson(json);
}

/// @nodoc
mixin _$CheckoutOrderItem {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckoutOrderItemCopyWith<CheckoutOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutOrderItemCopyWith<$Res> {
  factory $CheckoutOrderItemCopyWith(
          CheckoutOrderItem value, $Res Function(CheckoutOrderItem) then) =
      _$CheckoutOrderItemCopyWithImpl<$Res, CheckoutOrderItem>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String itemId,
      int quantity,
      String price,
      String orderId});
}

/// @nodoc
class _$CheckoutOrderItemCopyWithImpl<$Res, $Val extends CheckoutOrderItem>
    implements $CheckoutOrderItemCopyWith<$Res> {
  _$CheckoutOrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? itemId = null,
    Object? quantity = null,
    Object? price = null,
    Object? orderId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckoutOrderItemImplCopyWith<$Res>
    implements $CheckoutOrderItemCopyWith<$Res> {
  factory _$$CheckoutOrderItemImplCopyWith(_$CheckoutOrderItemImpl value,
          $Res Function(_$CheckoutOrderItemImpl) then) =
      __$$CheckoutOrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String itemId,
      int quantity,
      String price,
      String orderId});
}

/// @nodoc
class __$$CheckoutOrderItemImplCopyWithImpl<$Res>
    extends _$CheckoutOrderItemCopyWithImpl<$Res, _$CheckoutOrderItemImpl>
    implements _$$CheckoutOrderItemImplCopyWith<$Res> {
  __$$CheckoutOrderItemImplCopyWithImpl(_$CheckoutOrderItemImpl _value,
      $Res Function(_$CheckoutOrderItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? itemId = null,
    Object? quantity = null,
    Object? price = null,
    Object? orderId = null,
  }) {
    return _then(_$CheckoutOrderItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckoutOrderItemImpl implements _CheckoutOrderItem {
  const _$CheckoutOrderItemImpl(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.itemId,
      required this.quantity,
      required this.price,
      required this.orderId});

  factory _$CheckoutOrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutOrderItemImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String itemId;
  @override
  final int quantity;
  @override
  final String price;
  @override
  final String orderId;

  @override
  String toString() {
    return 'CheckoutOrderItem(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, itemId: $itemId, quantity: $quantity, price: $price, orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutOrderItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updatedAt, itemId, quantity, price, orderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutOrderItemImplCopyWith<_$CheckoutOrderItemImpl> get copyWith =>
      __$$CheckoutOrderItemImplCopyWithImpl<_$CheckoutOrderItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutOrderItemImplToJson(
      this,
    );
  }
}

abstract class _CheckoutOrderItem implements CheckoutOrderItem {
  const factory _CheckoutOrderItem(
      {required final String id,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String itemId,
      required final int quantity,
      required final String price,
      required final String orderId}) = _$CheckoutOrderItemImpl;

  factory _CheckoutOrderItem.fromJson(Map<String, dynamic> json) =
      _$CheckoutOrderItemImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get itemId;
  @override
  int get quantity;
  @override
  String get price;
  @override
  String get orderId;
  @override
  @JsonKey(ignore: true)
  _$$CheckoutOrderItemImplCopyWith<_$CheckoutOrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckoutTransaction _$CheckoutTransactionFromJson(Map<String, dynamic> json) {
  return _CheckoutTransaction.fromJson(json);
}

/// @nodoc
mixin _$CheckoutTransaction {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckoutTransactionCopyWith<CheckoutTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutTransactionCopyWith<$Res> {
  factory $CheckoutTransactionCopyWith(
          CheckoutTransaction value, $Res Function(CheckoutTransaction) then) =
      _$CheckoutTransactionCopyWithImpl<$Res, CheckoutTransaction>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      String currency,
      double amount,
      String orderId});
}

/// @nodoc
class _$CheckoutTransactionCopyWithImpl<$Res, $Val extends CheckoutTransaction>
    implements $CheckoutTransactionCopyWith<$Res> {
  _$CheckoutTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? currency = null,
    Object? amount = null,
    Object? orderId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckoutTransactionImplCopyWith<$Res>
    implements $CheckoutTransactionCopyWith<$Res> {
  factory _$$CheckoutTransactionImplCopyWith(_$CheckoutTransactionImpl value,
          $Res Function(_$CheckoutTransactionImpl) then) =
      __$$CheckoutTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      String currency,
      double amount,
      String orderId});
}

/// @nodoc
class __$$CheckoutTransactionImplCopyWithImpl<$Res>
    extends _$CheckoutTransactionCopyWithImpl<$Res, _$CheckoutTransactionImpl>
    implements _$$CheckoutTransactionImplCopyWith<$Res> {
  __$$CheckoutTransactionImplCopyWithImpl(_$CheckoutTransactionImpl _value,
      $Res Function(_$CheckoutTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? currency = null,
    Object? amount = null,
    Object? orderId = null,
  }) {
    return _then(_$CheckoutTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckoutTransactionImpl implements _CheckoutTransaction {
  const _$CheckoutTransactionImpl(
      {required this.id,
      required this.createdAt,
      required this.currency,
      required this.amount,
      required this.orderId});

  factory _$CheckoutTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final String currency;
  @override
  final double amount;
  @override
  final String orderId;

  @override
  String toString() {
    return 'CheckoutTransaction(id: $id, createdAt: $createdAt, currency: $currency, amount: $amount, orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, currency, amount, orderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutTransactionImplCopyWith<_$CheckoutTransactionImpl> get copyWith =>
      __$$CheckoutTransactionImplCopyWithImpl<_$CheckoutTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutTransactionImplToJson(
      this,
    );
  }
}

abstract class _CheckoutTransaction implements CheckoutTransaction {
  const factory _CheckoutTransaction(
      {required final String id,
      required final DateTime createdAt,
      required final String currency,
      required final double amount,
      required final String orderId}) = _$CheckoutTransactionImpl;

  factory _CheckoutTransaction.fromJson(Map<String, dynamic> json) =
      _$CheckoutTransactionImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  String get currency;
  @override
  double get amount;
  @override
  String get orderId;
  @override
  @JsonKey(ignore: true)
  _$$CheckoutTransactionImplCopyWith<_$CheckoutTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
