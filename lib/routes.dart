import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_side/provider/authentication_provider.dart';
import 'package:table_side/screens/admin/admin_dashboard.dart';
import 'package:table_side/screens/restaurants/dashboard.dart';
import 'package:table_side/screens/restaurants/restaurant_view.dart';
import 'package:table_side/screens/user/login.dart';
import 'package:table_side/screens/user/profile.dart';
import 'package:table_side/screens/user/profile_editor.dart';

part 'routes.g.dart';

GoRouter router(final RouterRef ref) {
  final isAuthenticatedState = ref.watch(isAuthenticatedProvider);
  // const isAuthenticatedState = true;
  const isAdmin = true;
  const isAuthenticated = true;

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

      // Authentication
      GoRoute(
        path: '/login',
        builder: (final BuildContext context, final GoRouterState state) {
          return const LoginScreen();
        },
      ),

      // Admin Dashboard
      GoRoute(
        path: '/admin',
        builder: (final BuildContext context, final GoRouterState state) {
          return const AdminDashboard();
        },
        redirect: (final BuildContext context, final GoRouterState state) {
          if (!isAdmin) {
            return '/login';
          }
          return null;
        },
      ),

      // Dashboard (for normal users)
      GoRoute(
        path: '/',
        builder: (final BuildContext context, final GoRouterState state) {
          return const Dashboard();
        },
        redirect: (final BuildContext context, final GoRouterState state) {
          if (!isAdmin) {
            return '/login';
          }
          return null;
        },
        routes: <RouteBase>[
          // Profile page
          GoRoute(
            path: 'profile',
            builder: (final BuildContext context, final GoRouterState state) {
              return const ProfileScreen();
            },
            routes: [
              GoRoute(
                path: 'profile/editProfile',
                builder:
                    (final BuildContext context, final GoRouterState state) {
                  return const ProfileEditorScreen();
                },
              )
            ],
          ),
          GoRoute(
            path: 'restaurant/:restaurantId',
            builder: (final BuildContext context, final GoRouterState state) {
              // final String restaurantID = state.pathParameters['restaurantId']!;
              // TODO(A): NEED TO GET CORRECT RESTAURANT ID
              // TODO(A): RESTAURANT VIEW
              // TODO(A): MAKE REQUEST TO GET INFO ABOUT RESTAURANT
              return const RestaurantView();
            },
          ),
        ],
      ),
    ],

    // Authentication
    redirect: (final context, final routerState) {
      // if (isAuthenticatedState.isLoading) return '/_loading';

      final bool requiresAuth = routerState.fullPath! != '/login';
      // final bool isAuthenticated = isAuthenticatedState.requireValue;

      if (isAuthenticated) {
        if (requiresAuth != isAuthenticated) return '/';
      } else {
        if (requiresAuth != isAuthenticated) return '/login';
      }

      if (isAdmin && isAuthenticated) {
        if (requiresAuth == isAuthenticated) return '/admin';
      } else {
        if (requiresAuth != isAuthenticated) return '/login';
      }
      return null;
    },
  );
}
