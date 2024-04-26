// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$menusHash() => r'37d25d65d10033b292f4bd1e1f097bd414d9e225';

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

/// List all menus for a restaurant
///
/// Copied from [menus].
@ProviderFor(menus)
const menusProvider = MenusFamily();

/// List all menus for a restaurant
///
/// Copied from [menus].
class MenusFamily extends Family<AsyncValue<List<Menu>>> {
  /// List all menus for a restaurant
  ///
  /// Copied from [menus].
  const MenusFamily();

  /// List all menus for a restaurant
  ///
  /// Copied from [menus].
  MenusProvider call(
    String restaurantId,
  ) {
    return MenusProvider(
      restaurantId,
    );
  }

  @override
  MenusProvider getProviderOverride(
    covariant MenusProvider provider,
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
  String? get name => r'menusProvider';
}

/// List all menus for a restaurant
///
/// Copied from [menus].
class MenusProvider extends AutoDisposeFutureProvider<List<Menu>> {
  /// List all menus for a restaurant
  ///
  /// Copied from [menus].
  MenusProvider(
    String restaurantId,
  ) : this._internal(
          (ref) => menus(
            ref as MenusRef,
            restaurantId,
          ),
          from: menusProvider,
          name: r'menusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$menusHash,
          dependencies: MenusFamily._dependencies,
          allTransitiveDependencies: MenusFamily._allTransitiveDependencies,
          restaurantId: restaurantId,
        );

  MenusProvider._internal(
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
    FutureOr<List<Menu>> Function(MenusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MenusProvider._internal(
        (ref) => create(ref as MenusRef),
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
  AutoDisposeFutureProviderElement<List<Menu>> createElement() {
    return _MenusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MenusProvider && other.restaurantId == restaurantId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, restaurantId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MenusRef on AutoDisposeFutureProviderRef<List<Menu>> {
  /// The parameter `restaurantId` of this provider.
  String get restaurantId;
}

class _MenusProviderElement extends AutoDisposeFutureProviderElement<List<Menu>>
    with MenusRef {
  _MenusProviderElement(super.provider);

  @override
  String get restaurantId => (origin as MenusProvider).restaurantId;
}

String _$menuInfoHash() => r'5cd47a4dc2423695f14e1bdc591152cf9ecc60fb';

/// Get information about a specific menu
///
/// Copied from [menuInfo].
@ProviderFor(menuInfo)
const menuInfoProvider = MenuInfoFamily();

/// Get information about a specific menu
///
/// Copied from [menuInfo].
class MenuInfoFamily extends Family<AsyncValue<Menu>> {
  /// Get information about a specific menu
  ///
  /// Copied from [menuInfo].
  const MenuInfoFamily();

  /// Get information about a specific menu
  ///
  /// Copied from [menuInfo].
  MenuInfoProvider call(
    String restaurantId,
    String menuId,
  ) {
    return MenuInfoProvider(
      restaurantId,
      menuId,
    );
  }

  @override
  MenuInfoProvider getProviderOverride(
    covariant MenuInfoProvider provider,
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
  String? get name => r'menuInfoProvider';
}

/// Get information about a specific menu
///
/// Copied from [menuInfo].
class MenuInfoProvider extends AutoDisposeFutureProvider<Menu> {
  /// Get information about a specific menu
  ///
  /// Copied from [menuInfo].
  MenuInfoProvider(
    String restaurantId,
    String menuId,
  ) : this._internal(
          (ref) => menuInfo(
            ref as MenuInfoRef,
            restaurantId,
            menuId,
          ),
          from: menuInfoProvider,
          name: r'menuInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$menuInfoHash,
          dependencies: MenuInfoFamily._dependencies,
          allTransitiveDependencies: MenuInfoFamily._allTransitiveDependencies,
          restaurantId: restaurantId,
          menuId: menuId,
        );

  MenuInfoProvider._internal(
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
    FutureOr<Menu> Function(MenuInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MenuInfoProvider._internal(
        (ref) => create(ref as MenuInfoRef),
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
  AutoDisposeFutureProviderElement<Menu> createElement() {
    return _MenuInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MenuInfoProvider &&
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

mixin MenuInfoRef on AutoDisposeFutureProviderRef<Menu> {
  /// The parameter `restaurantId` of this provider.
  String get restaurantId;

  /// The parameter `menuId` of this provider.
  String get menuId;
}

class _MenuInfoProviderElement extends AutoDisposeFutureProviderElement<Menu>
    with MenuInfoRef {
  _MenuInfoProviderElement(super.provider);

  @override
  String get restaurantId => (origin as MenuInfoProvider).restaurantId;
  @override
  String get menuId => (origin as MenuInfoProvider).menuId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
