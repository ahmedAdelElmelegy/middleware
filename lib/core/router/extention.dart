import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:middleware_tasks/core/routers/auth_middle_ware.dart';
import 'package:middleware_tasks/screens/home.dart';
import 'package:middleware_tasks/screens/login.dart';
import 'package:middleware_tasks/screens/profile.dart';
import 'package:middleware_tasks/screens/setting.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage()),
    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    GoRoute(path: '/profile', builder: (context, state) => ProfilePage()),
    GoRoute(path: '/settings', builder: (context, state) => SettingsPage()),
  ],

  redirect: (context, state) {
    return RouterMiddleware.redirect(context, state);
  },

  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 64, color: Colors.red),
          SizedBox(height: 16),
          Text('Page Not Found', style: TextStyle(fontSize: 18)),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: Text('Go Back'),
          ),
        ],
      ),
    ),
  ),
);
