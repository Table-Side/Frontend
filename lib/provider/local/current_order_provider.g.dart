// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentOrderHash() => r'9bd681feb2e5af38a9785ec54977748c3ab777e3';

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

abstract class _$CurrentOrder
    extends BuildlessAutoDisposeNotifier<Map<String, int>> {
  late final String restaurant;
  late final String menu;

  Map<String, int> build(
    String restaurant,
    String menu,
  );
}

/// Contains the current order for a (restaurant, menu) combination (family
/// provider). The order is represented as a map of item IDs to quantities.
///
/// Copied from [CurrentOrder].
@ProviderFor(CurrentOrder)
const currentOrderProvider = CurrentOrderFamily();

/// Contains the current order for a (restaurant, menu) combination (family
/// provider). The order is represented as a map of item IDs to quantities.
///
/// Copied from [CurrentOrder].
class CurrentOrderFamily extends Family<Map<String, int>> {
  /// Contains the current order for a (restaurant, menu) combination (family
  /// provider). The order is represented as a map of item IDs to quantities.
  ///
  /// Copied from [CurrentOrder].
  const CurrentOrderFamily();

  /// Contains the current order for a (restaurant, menu) combination (family
  /// provider). The order is represented as a map of item IDs to quantities.
  ///
  /// Copied from [CurrentOrder].
  CurrentOrderProvider call(
    String restaurant,
    String menu,
  ) {
    return CurrentOrderProvider(
      restaurant,
      menu,
    );
  }

  @override
  CurrentOrderProvider getProviderOverride(
    covariant CurrentOrderProvider provider,
  ) {
    return call(
      provider.restaurant,
      provider.menu,
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
  String? get name => r'currentOrderProvider';
}

/// Contains the current order for a (restaurant, menu) combination (family
/// provider). The order is represented as a map of item IDs to quantities.
///
/// Copied from [CurrentOrder].
class CurrentOrderProvider
    extends AutoDisposeNotifierProviderImpl<CurrentOrder, Map<String, int>> {
  /// Contains the current order for a (restaurant, menu) combination (family
  /// provider). The order is represented as a map of item IDs to quantities.
  ///
  /// Copied from [CurrentOrder].
  CurrentOrderProvider(
    String restaurant,
    String menu,
  ) : this._internal(
          () => CurrentOrder()
            ..restaurant = restaurant
            ..menu = menu,
          from: currentOrderProvider,
          name: r'currentOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentOrderHash,
          dependencies: CurrentOrderFamily._dependencies,
          allTransitiveDependencies:
              CurrentOrderFamily._allTransitiveDependencies,
          restaurant: restaurant,
          menu: menu,
        );

  CurrentOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.restaurant,
    required this.menu,
  }) : super.internal();

  final String restaurant;
  final String menu;

  @override
  Map<String, int> runNotifierBuild(
    covariant CurrentOrder notifier,
  ) {
    return notifier.build(
      restaurant,
      menu,
    );
  }

  @override
  Override overrideWith(CurrentOrder Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentOrderProvider._internal(
        () => create()
          ..restaurant = restaurant
          ..menu = menu,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        restaurant: restaurant,
        menu: menu,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CurrentOrder, Map<String, int>>
      createElement() {
    return _CurrentOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentOrderProvider &&
        other.restaurant == restaurant &&
        other.menu == menu;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, restaurant.hashCode);
    hash = _SystemHash.combine(hash, menu.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrentOrderRef on AutoDisposeNotifierProviderRef<Map<String, int>> {
  /// The parameter `restaurant` of this provider.
  String get restaurant;

  /// The parameter `menu` of this provider.
  String get menu;
}

class _CurrentOrderProviderElement
    extends AutoDisposeNotifierProviderElement<CurrentOrder, Map<String, int>>
    with CurrentOrderRef {
  _CurrentOrderProviderElement(super.provider);

  @override
  String get restaurant => (origin as CurrentOrderProvider).restaurant;
  @override
  String get menu => (origin as CurrentOrderProvider).menu;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
