import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationHelper {
  static void goToRoute(BuildContext context, String route) {
    final currentRoute = GoRouterState.of(context).uri.path;

    if (currentRoute != route) {
      context.go(route);
    }
  }

  static String getCurrentRoute(BuildContext context) {
    return GoRouterState.of(context).uri.path;
  }

  static bool isCurrentRoute(BuildContext context, String route) {
    return getCurrentRoute(context) == route;
  }
}
