// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kitchen_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ordersHash() => r'9e91e253c89e127de2eda46f33ba455f0c5a0094';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// List all orders for a restaurant
///
/// Copied from [orders].
@ProviderFor(orders)
const ordersProvider = OrdersFamily();

/// List all orders for a restaurant
///
/// Copied from [orders].
class OrdersFamily extends Family<AsyncValue<List<Transaction>>> {
  /// List all orders for a restaurant
  ///
  /// Copied from [orders].
  const OrdersFamily();

  /// List all orders for a restaurant
  ///
  /// Copied from [orders].
  OrdersProvider call(
    String restaurantId,
  ) {
    return OrdersProvider(
      restaurantId,
    );
  }

  @override
  OrdersProvider getProviderOverride(
    covariant OrdersProvider provider,
  ) {
    return call(
      provider.restaurantId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ordersProvider';
}

/// List all orders for a restaurant
///
/// Copied from [orders].
class OrdersProvider extends AutoDisposeFutureProvider<List<Transaction>> {
  /// List all orders for a restaurant
  ///
  /// Copied from [orders].
  OrdersProvider(
    String restaurantId,
  ) : this._internal(
          (ref) => orders(
            ref as OrdersRef,
            restaurantId,
          ),
          from: ordersProvider,
          name: r'ordersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ordersHash,
          dependencies: OrdersFamily._dependencies,
          allTransitiveDependencies: OrdersFamily._allTransitiveDependencies,
          restaurantId: restaurantId,
        );

  OrdersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.restaurantId,
  }) : super.internal();

  final String restaurantId;

  @override
  Override overrideWith(
    FutureOr<List<Transaction>> Function(OrdersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OrdersProvider._internal(
        (ref) => create(ref as OrdersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        restaurantId: restaurantId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Transaction>> createElement() {
    return _OrdersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrdersProvider && other.restaurantId == restaurantId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, restaurantId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OrdersRef on AutoDisposeFutureProviderRef<List<Transaction>> {
  /// The parameter `restaurantId` of this provider.
  String get restaurantId;
}

class _OrdersProviderElement
    extends AutoDisposeFutureProviderElement<List<Transaction>> with OrdersRef {
  _OrdersProviderElement(super.provider);

  @override
  String get restaurantId => (origin as OrdersProvider).restaurantId;
}

String _$orderInfoHash() => r'b1593cf480582240a6ea983132ef8a55a202dfe0';

/// Get information about a specific order
///
/// Copied from [orderInfo].
@ProviderFor(orderInfo)
const orderInfoProvider = OrderInfoFamily();

/// Get information about a specific order
///
/// Copied from [orderInfo].
class OrderInfoFamily extends Family<AsyncValue<Order>> {
  /// Get information about a specific order
  ///
  /// Copied from [orderInfo].
  const OrderInfoFamily();

  /// Get information about a specific order
  ///
  /// Copied from [orderInfo].
  OrderInfoProvider call(
    String restaurantId,
    String orderId,
  ) {
    return OrderInfoProvider(
      restaurantId,
      orderId,
    );
  }

  @override
  OrderInfoProvider getProviderOverride(
    covariant OrderInfoProvider provider,
  ) {
    return call(
      provider.restaurantId,
      provider.orderId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'orderInfoProvider';
}

/// Get information about a specific order
///
/// Copied from [orderInfo].
class OrderInfoProvider extends AutoDisposeFutureProvider<Order> {
  /// Get information about a specific order
  ///
  /// Copied from [orderInfo].
  OrderInfoProvider(
    String restaurantId,
    String orderId,
  ) : this._internal(
          (ref) => orderInfo(
            ref as OrderInfoRef,
            restaurantId,
            orderId,
          ),
          from: orderInfoProvider,
          name: r'orderInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$orderInfoHash,
          dependencies: OrderInfoFamily._dependencies,
          allTransitiveDependencies: OrderInfoFamily._allTransitiveDependencies,
          restaurantId: restaurantId,
          orderId: orderId,
        );

  OrderInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.restaurantId,
    required this.orderId,
  }) : super.internal();

  final String restaurantId;
  final String orderId;

  @override
  Override overrideWith(
    FutureOr<Order> Function(OrderInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OrderInfoProvider._internal(
        (ref) => create(ref as OrderInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        restaurantId: restaurantId,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Order> createElement() {
    return _OrderInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderInfoProvider &&
        other.restaurantId == restaurantId &&
        other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, restaurantId.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OrderInfoRef on AutoDisposeFutureProviderRef<Order> {
  /// The parameter `restaurantId` of this provider.
  String get restaurantId;

  /// The parameter `orderId` of this provider.
  String get orderId;
}

class _OrderInfoProviderElement extends AutoDisposeFutureProviderElement<Order>
    with OrderInfoRef {
  _OrderInfoProviderElement(super.provider);

  @override
  String get restaurantId => (origin as OrderInfoProvider).restaurantId;
  @override
  String get orderId => (origin as OrderInfoProvider).orderId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
