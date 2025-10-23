import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationHelper {
  // منع التنقل إذا كنا بالفعل في نفس الصفحة
  static void goToRoute(BuildContext context, String route) {
    final currentRoute = GoRouterState.of(context).uri.path;

    if (currentRoute != route) {
      context.go(route);
    }
  }

  // الحصول على المسار الحالي
  static String getCurrentRoute(BuildContext context) {
    return GoRouterState.of(context).uri.path;
  }

  // التحقق إذا كنا في مسار معين
  static bool isCurrentRoute(BuildContext context, String route) {
    return getCurrentRoute(context) == route;
  }
}
