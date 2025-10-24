import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:middleware_tasks/manager/cubit/auth_cubit.dart';

class RouterMiddleware {
  static String? redirect(BuildContext context, GoRouterState state) {
    final authCubit = context.read<AuthCubit>();
    final currentPath = state.uri.path;

    debugPrint('Middleware Path : $currentPath');

    final protectedRoutes = ['/profile', '/settings'];

    if (protectedRoutes.contains(currentPath) && !authCubit.state.isLoggedIn) {
      debugPrint('User is not logged in, redirecting to /login');
      return '/login';
    }

    if (currentPath == '/login' && authCubit.state.isLoggedIn) {
      debugPrint('User is logged in, redirecting to /');
      return '/';
    }

    return null;
  }
}
