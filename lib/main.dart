import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:table_side/network/authentication.dart';
import 'package:table_side/network/network.dart';
import 'package:table_side/screens/admin/admin_dashboard.dart';
import 'package:table_side/screens/restaurants/dashboard.dart';
import 'package:table_side/screens/restaurants/restaurant_view.dart';
import 'package:table_side/screens/user/auth_pages.dart';
import 'package:table_side/screens/user/profile_pages.dart';
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

class TablesideApp extends StatelessWidget {
  const TablesideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table Side',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AdminDashboard(),
      routes: {
        "/auth": (context) => const AuthPages(),
        "/profile": (context) => const ProfilePages(),
        "/dashboard": (context) => const Dashboard(),
        "/restaurant_view": (context) => const RestaurantView(),
        "/admin_dashboard": (context) => const AdminDashboard(),
      },
    );
  }
}
