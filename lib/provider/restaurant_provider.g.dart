// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$restaurantInfoHash() => r'd48d92f635a040ff3c6a1ca243f2ee4e2a138e87';

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
class RestaurantInfoFamily extends Family<AsyncValue<RestaurantDetails>> {
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
class RestaurantInfoProvider
    extends AutoDisposeFutureProvider<RestaurantDetails> {
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
    FutureOr<RestaurantDetails> Function(RestaurantInfoRef provider) create,
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
  AutoDisposeFutureProviderElement<RestaurantDetails> createElement() {
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

mixin RestaurantInfoRef on AutoDisposeFutureProviderRef<RestaurantDetails> {
  /// The parameter `restaurantId` of this provider.
  String get restaurantId;
}

class _RestaurantInfoProviderElement
    extends AutoDisposeFutureProviderElement<RestaurantDetails>
    with RestaurantInfoRef {
  _RestaurantInfoProviderElement(super.provider);

  @override
  String get restaurantId => (origin as RestaurantInfoProvider).restaurantId;
}

String _$restaurantsHash() => r'9873895fec8c6b7a47950c03a8aa6e649d0a8acf';

/// See also [Restaurants].
@ProviderFor(Restaurants)
final restaurantsProvider = AutoDisposeAsyncNotifierProvider<Restaurants,
    List<RestaurantDetails>?>.internal(
  Restaurants.new,
  name: r'restaurantsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$restaurantsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Restaurants = AutoDisposeAsyncNotifier<List<RestaurantDetails>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
