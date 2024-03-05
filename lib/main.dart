import 'package:flutter/material.dart';
import 'package:table_side/screens/admin/admin_dashboard.dart';
import 'package:table_side/screens/restaurants/dashboard.dart';
import 'package:table_side/screens/restaurants/restaurant_view.dart';
import 'package:table_side/screens/user/auth_pages.dart';
import 'package:table_side/screens/user/profile_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table Side',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Dashboard(),
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
