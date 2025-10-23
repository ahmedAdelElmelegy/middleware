import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:middleware_tasks/manager/cubit/auth_cubit.dart';

class RouterMiddleware {
  // Middleware للتحقق من تسجيل الدخول
  static String? redirect(BuildContext context, GoRouterState state) {
    final authCubit = context.read<AuthCubit>();
    final currentPath = state.uri.path;

    debugPrint('محاولة التنقل إلى: $currentPath');

    // الصفحات التي تحتاج تسجيل دخول
    final protectedRoutes = ['/profile', '/settings'];

    // إذا حاول الوصول لصفحة محمية وهو غير مسجل
    if (protectedRoutes.contains(currentPath) && !authCubit.state.isLoggedIn) {
      debugPrint('يحتاج تسجيل دخول، إعادة التوجيه إلى /login');
      return '/login';
    }

    // إذا كان مسجل دخول ويحاول الذهاب لصفحة Login
    if (currentPath == '/login' && authCubit.state.isLoggedIn) {
      debugPrint('مستخدم مسجل، إعادة التوجيه إلى /');
      return '/';
    }

    return null; // أكمل التنقل الطبيعي
  }
}
