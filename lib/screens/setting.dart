import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الإعدادات')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.language),
            title: Text('اللغة'),
            subtitle: Text('العربية'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('الإشعارات'),
            subtitle: Text('مفعل'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('الخصوصية'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('المساعدة'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('حول التطبيق'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('حول التطبيق'),
                  content: Text('تطبيق تجريبي لـ GoRouter مع Cubit'),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text('حسناً'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
