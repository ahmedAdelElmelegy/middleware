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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
                SizedBox(height: 16),
                if (state.isLoggedIn) ...[
                  Text(
                    state.userName!,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Active',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  SizedBox(height: 32),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Email'),
                      subtitle: Text('user@test.com'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.date_range),
                      title: Text('Date of registration'),
                      subtitle: Text('1 January 2024'),
                    ),
                  ),
                ] else ...[
                  Text(
                    'Not logged in',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  SizedBox(height: 16),
                  Text('Please login to view profile'),
                ],
                SizedBox(height: 32),
                if (state.isLoggedIn)
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                      Router.neglect(context, () => context.pop());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text('Logout'),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
