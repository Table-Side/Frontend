// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemsHash() => r'e66f4dd264bd30aca35a2208ce9330ad9d87c334';

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

/// List all items for a menu
///
/// Copied from [items].
@ProviderFor(items)
const itemsProvider = ItemsFamily();

/// List all items for a menu
///
/// Copied from [items].
class ItemsFamily extends Family<AsyncValue<List<Item>>> {
  /// List all items for a menu
  ///
  /// Copied from [items].
  const ItemsFamily();

  /// List all items for a menu
  ///
  /// Copied from [items].
  ItemsProvider call(
    String restaurantId,
    String menuId,
  ) {
    return ItemsProvider(
      restaurantId,
      menuId,
    );
  }

  @override
  ItemsProvider getProviderOverride(
    covariant ItemsProvider provider,
  ) {
    return call(
      provider.restaurantId,
      provider.menuId,
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
  String? get name => r'itemsProvider';
}

/// List all items for a menu
///
/// Copied from [items].
class ItemsProvider extends AutoDisposeFutureProvider<List<Item>> {
  /// List all items for a menu
  ///
  /// Copied from [items].
  ItemsProvider(
    String restaurantId,
    String menuId,
  ) : this._internal(
          (ref) => items(
            ref as ItemsRef,
            restaurantId,
            menuId,
          ),
          from: itemsProvider,
          name: r'itemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$itemsHash,
          dependencies: ItemsFamily._dependencies,
          allTransitiveDependencies: ItemsFamily._allTransitiveDependencies,
          restaurantId: restaurantId,
          menuId: menuId,
        );

  ItemsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.restaurantId,
    required this.menuId,
  }) : super.internal();

  final String restaurantId;
  final String menuId;

  @override
  Override overrideWith(
    FutureOr<List<Item>> Function(ItemsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ItemsProvider._internal(
        (ref) => create(ref as ItemsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        restaurantId: restaurantId,
        menuId: menuId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Item>> createElement() {
    return _ItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemsProvider &&
        other.restaurantId == restaurantId &&
        other.menuId == menuId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, restaurantId.hashCode);
    hash = _SystemHash.combine(hash, menuId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ItemsRef on AutoDisposeFutureProviderRef<List<Item>> {
  /// The parameter `restaurantId` of this provider.
  String get restaurantId;

  /// The parameter `menuId` of this provider.
  String get menuId;
}

class _ItemsProviderElement extends AutoDisposeFutureProviderElement<List<Item>>
    with ItemsRef {
  _ItemsProviderElement(super.provider);

  @override
  String get restaurantId => (origin as ItemsProvider).restaurantId;
  @override
  String get menuId => (origin as ItemsProvider).menuId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
