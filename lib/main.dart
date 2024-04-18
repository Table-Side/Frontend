import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:table_side/network/authentication.dart';
import 'package:table_side/network/network.dart';
import 'package:table_side/network/restaurants.dart';
import 'package:table_side/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const FlutterSecureStorage storage = FlutterSecureStorage(
  aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
    resetOnError: true,
  ),
);

final _apiClient = setUpClient(
  services: [
    AuthenticationService.create(),
    RestaurantsService.create(),
  ],
);

T getApiService<T extends ChopperService>() {
  return _apiClient.getService<T>();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: TablesideApp(),
    ),
  );
}

class TablesideApp extends ConsumerWidget {
  const TablesideApp({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Table Side',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
    );
  }
}
