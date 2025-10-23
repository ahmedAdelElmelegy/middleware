// import 'package:go_router/go_router.dart';
// import 'package:middleware_tasks/screens/admin.dart';
// import 'package:middleware_tasks/screens/home.dart';
// import 'package:middleware_tasks/screens/login.dart';
// import 'package:middleware_tasks/screens/profile.dart';

// GoRouter router = GoRouter(
//   redirect: (context, state) {
//     // middleware بسيط للتسجيل
//     print('التنقل إلى: ${state.uri}');
//     print('المعاملات: ${state.uri.queryParameters}');
//     return null; // null يعني أكمل التنقل الطبيعي
//   },
//   initialLocation: '/',
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/profile',
//       builder: (context, state) => const ProfileScreen(),
//     ),
//     GoRoute(path: '/', builder: (context, state) => const HomePage()),
//     GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
//     GoRoute(path: '/admin', builder: (context, state) => const AdminScreen()),
//   ],
// );
