import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_side/models/user.dart';
import 'package:table_side/models/user_details.dart';
import 'package:table_side/provider/authentication_provider.dart';
import 'package:table_side/screens/admin/admin_dashboard.dart';
import 'package:table_side/screens/restaurants/dashboard.dart';
import 'package:table_side/screens/restaurants/restaurant_view.dart';
import 'package:table_side/screens/user/login.dart';
import 'package:table_side/screens/user/profile.dart';
import 'package:table_side/screens/user/profile_editor.dart';

part 'routes.g.dart';

final GlobalKey<NavigatorState> _routerKey = GlobalKey<NavigatorState>();

GlobalKey<NavigatorState> get routerKey => _routerKey;

GoRouter router(final RouterRef ref) {
  final isAuthenticatedState = ref.watch(isAuthenticatedProvider);

  final currentUser = ref
      .watch(authenticationProvider)
      .maybeWhen(data: (user) => user, orElse: () {});

  bool isAdmin = false;

  if (currentUser != null && currentUser.user.roles.contains('restaurant')) {
    isAdmin = true;
  }

  // print("here: ${currentUser?.user.roles}");

  return GoRouter(
    routes: <RouteBase>[
      // Loading
      GoRoute(
        path: '/_loading',
        builder: (final BuildContext context, final GoRouterState state) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),

      // login
      GoRoute(
        path: '/login',
        builder: (final BuildContext context, final GoRouterState state) {
          return const LoginScreen();
        },
      ),

      //dashboard
      GoRoute(
        path: '/',
        builder: (final BuildContext context, final GoRouterState state) {
          if (isAdmin) {
            return const AdminDashboard();
          }
          return const Dashboard();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'profile',
            builder: (final BuildContext context, final GoRouterState state) {
              return const ProfileScreen();
            },
            routes: [
              GoRoute(
                path: 'editProfile',
                builder:
                    (final BuildContext context, final GoRouterState state) {
                  return const ProfileEditorScreen();
                },
              )
            ],
          ),
          GoRoute(
            path: 'restaurant/:restaurantId/details',
            builder: (final BuildContext context, final GoRouterState state) {
              final String restaurantId = state.pathParameters['restaurantId']!;
              return RestaurantView(restaurantId: restaurantId);
            },
          ),
        ],
      ),
    ],

    // Authentication
    redirect: (final context, final routerState) {
      if (isAuthenticatedState.isLoading) return '/_loading';

      final bool requiresAuth = routerState.fullPath! != '/login';
      final bool isAuthenticated = isAuthenticatedState.requireValue;

      if (isAuthenticated) {
        if (requiresAuth != isAuthenticated) return '/';
      } else {
        if (requiresAuth != isAuthenticated) return '/login';
      }

      return null;
    },
  );
}
