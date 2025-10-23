import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:middleware_tasks/manager/cubit/auth_cubit.dart';
import 'package:url_strategy/url_strategy.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/profile.dart';
import 'screens/setting.dart';
import 'core/routers/auth_middle_ware.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // إنشاء الـ Cubit
  final AuthCubit _authCubit = AuthCubit();

  // إعداد GoRouter
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomePage()),
      GoRoute(path: '/login', builder: (context, state) => LoginPage()),
      GoRoute(path: '/profile', builder: (context, state) => ProfilePage()),
      GoRoute(path: '/settings', builder: (context, state) => SettingsPage()),
    ],

    // استخدام الـ Middleware
    redirect: (context, state) {
      return RouterMiddleware.redirect(context, state);
    },

    // إعادة التوجيه عند حدوث أخطاء
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, size: 64, color: Colors.red),
            SizedBox(height: 16),
            Text('الصفحة غير موجودة', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: Text('العودة للرئيسية'),
            ),
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // توفير الـ Cubit للتطبيق
      create: (context) => _authCubit,
      child: MaterialApp.router(
        title: 'GoRouter بسيط',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
