// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$restaurantsHash() => r'ebb732ee2108894d624b36780158a14ecdc6f93b';

/// See also [restaurants].
@ProviderFor(restaurants)
final restaurantsProvider =
    AutoDisposeFutureProvider<List<Restaurant>>.internal(
  restaurants,
  name: r'restaurantsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$restaurantsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RestaurantsRef = AutoDisposeFutureProviderRef<List<Restaurant>>;
String _$restaurantInfoHash() => r'960a76a6f1334c293cc9ad5df2463ad133bdf955';

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

/// See also [restaurantInfo].
@ProviderFor(restaurantInfo)
const restaurantInfoProvider = RestaurantInfoFamily();

/// See also [restaurantInfo].
class RestaurantInfoFamily extends Family<AsyncValue<Restaurant>> {
  /// See also [restaurantInfo].
  const RestaurantInfoFamily();

  /// See also [restaurantInfo].
  RestaurantInfoProvider call(
    String restaurantId,
  ) {
    return RestaurantInfoProvider(
      restaurantId,
    );
  }

  @override
  RestaurantInfoProvider getProviderOverride(
    covariant RestaurantInfoProvider provider,
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
  String? get name => r'restaurantInfoProvider';
}

/// See also [restaurantInfo].
class RestaurantInfoProvider extends AutoDisposeFutureProvider<Restaurant> {
  /// See also [restaurantInfo].
  RestaurantInfoProvider(
    String restaurantId,
  ) : this._internal(
          (ref) => restaurantInfo(
            ref as RestaurantInfoRef,
            restaurantId,
          ),
          from: restaurantInfoProvider,
          name: r'restaurantInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$restaurantInfoHash,
          dependencies: RestaurantInfoFamily._dependencies,
          allTransitiveDependencies:
              RestaurantInfoFamily._allTransitiveDependencies,
          restaurantId: restaurantId,
        );

  RestaurantInfoProvider._internal(
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
    FutureOr<Restaurant> Function(RestaurantInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RestaurantInfoProvider._internal(
        (ref) => create(ref as RestaurantInfoRef),
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
  AutoDisposeFutureProviderElement<Restaurant> createElement() {
    return _RestaurantInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RestaurantInfoProvider &&
        other.restaurantId == restaurantId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, restaurantId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RestaurantInfoRef on AutoDisposeFutureProviderRef<Restaurant> {
  /// The parameter `restaurantId` of this provider.
  String get restaurantId;
}

class _RestaurantInfoProviderElement
    extends AutoDisposeFutureProviderElement<Restaurant>
    with RestaurantInfoRef {
  _RestaurantInfoProviderElement(super.provider);

  @override
  String get restaurantId => (origin as RestaurantInfoProvider).restaurantId;
}

String _$ownedRestaurantsHash() => r'83807688ef3323f0ad837cee9a1a1e91b462cec1';

/// See also [ownedRestaurants].
@ProviderFor(ownedRestaurants)
final ownedRestaurantsProvider =
    AutoDisposeFutureProvider<List<Restaurant>>.internal(
  ownedRestaurants,
  name: r'ownedRestaurantsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ownedRestaurantsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OwnedRestaurantsRef = AutoDisposeFutureProviderRef<List<Restaurant>>;
String _$primaryOwnedRestaurantHash() =>
    r'6ff8d49f79c5098aae066aa9e0dc3492f95cff2e';

/// See also [primaryOwnedRestaurant].
@ProviderFor(primaryOwnedRestaurant)
final primaryOwnedRestaurantProvider =
    AutoDisposeProvider<AsyncValue<Restaurant?>>.internal(
  primaryOwnedRestaurant,
  name: r'primaryOwnedRestaurantProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$primaryOwnedRestaurantHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PrimaryOwnedRestaurantRef
    = AutoDisposeProviderRef<AsyncValue<Restaurant?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
