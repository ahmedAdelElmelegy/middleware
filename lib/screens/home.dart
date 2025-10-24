import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:middleware_tasks/core/routers/navgator_helper.dart';
import 'package:middleware_tasks/manager/cubit/auth_cubit.dart';
import 'package:middleware_tasks/manager/cubit/auth_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الصفحة الرئيسية')),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.isLoggedIn) ...[
                    Icon(Icons.check_circle, color: Colors.green, size: 64),
                    SizedBox(height: 16),
                    Text(
                      'Welcome ${state.userName}!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'You are logged in now',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ] else ...[
                    Icon(Icons.person_outline, color: Colors.blue, size: 64),
                    SizedBox(height: 16),
                    Text(
                      'Welcome visitor!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Please login to access all features',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                  SizedBox(height: 32),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            NavigationHelper.goToRoute(context, '/'),
                        child: Text('Home'),
                      ),
                      ElevatedButton(
                        onPressed: () => context.push('/profile'),
                        child: Text('Profile'),
                      ),
                      ElevatedButton(
                        onPressed: () => context.push('/settings'),
                        child: Text('Settings'),
                      ),
                      if (!state.isLoggedIn)
                        ElevatedButton(
                          onPressed: () => context.push('/login'),
                          child: Text('Login'),
                        ),
                      if (state.isLoggedIn)
                        ElevatedButton(
                          onPressed: () {
                            context.read<AuthCubit>().logout();
                            NavigationHelper.goToRoute(context, '/');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text('Logout'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
