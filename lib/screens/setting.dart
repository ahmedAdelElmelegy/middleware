import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16.0),

          children: [
            Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              subtitle: Text('English'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              subtitle: Text('Enabled'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Privacy'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('About'),
                    content: Text('Flutter Middleware Task'),
                    actions: [
                      TextButton(
                        onPressed: () => context.go('/'),
                        child: Text('Ok'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
