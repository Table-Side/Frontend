// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isAuthenticatedHash() => r'f0bc29c69243a36f0c81e3e89b439bf91454ba82';

/// See also [isAuthenticated].
@ProviderFor(isAuthenticated)
final isAuthenticatedProvider = AutoDisposeProvider<AsyncValue<bool>>.internal(
  isAuthenticated,
  name: r'isAuthenticatedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAuthenticatedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsAuthenticatedRef = AutoDisposeProviderRef<AsyncValue<bool>>;
String _$authenticationHash() => r'82132c330d4e36d1ff3458e55d079d9b44cddf91';

/// See also [Authentication].
@ProviderFor(Authentication)
final authenticationProvider =
    AutoDisposeAsyncNotifierProvider<Authentication, User?>.internal(
  Authentication.new,
  name: r'authenticationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Authentication = AutoDisposeAsyncNotifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
