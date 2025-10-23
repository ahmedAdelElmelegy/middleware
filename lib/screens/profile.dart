import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:middleware_tasks/manager/cubit/auth_cubit.dart';
import 'package:middleware_tasks/manager/cubit/auth_state.dart';
import 'package:middleware_tasks/core/routers/navgator_helper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('الملف الشخصي')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
                SizedBox(height: 16),
                if (state.isLoggedIn) ...[
                  Text(
                    state.userName!,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'مستخدم نشط',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  SizedBox(height: 32),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.email),
                      title: Text('البريد الإلكتروني'),
                      subtitle: Text('user@test.com'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.date_range),
                      title: Text('تاريخ التسجيل'),
                      subtitle: Text('١ يناير ٢٠٢٤'),
                    ),
                  ),
                ] else ...[
                  Text(
                    'غير مسجل الدخول',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  SizedBox(height: 16),
                  Text('يرجى تسجيل الدخول لعرض الملف الشخصي'),
                ],
                SizedBox(height: 32),
                if (state.isLoggedIn)
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                      NavigationHelper.goToRoute(context, '/');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text('تسجيل الخروج'),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
