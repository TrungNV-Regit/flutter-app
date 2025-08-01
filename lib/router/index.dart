import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:my_app/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../layouts/app_shell.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/auth/login_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final isLoggedIn = userProvider.isLoggedIn;
    final goingToLogin = state.matchedLocation == '/login';

    if (!isLoggedIn && !goingToLogin) {
      return '/login';
    }

    if (isLoggedIn && goingToLogin) {
      return '/';
    }

    return null;
  },

  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => HomeScreen()),
        GoRoute(path: '/profile', builder: (context, state) => Text('profile')),
        GoRoute(
          path: '/settings',
          builder: (context, state) => Text('settings'),
        ),
      ],
    ),

    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
  ],
);
