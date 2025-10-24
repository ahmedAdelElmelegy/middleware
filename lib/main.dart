import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:middleware_tasks/core/router/extention.dart';
import 'package:middleware_tasks/manager/cubit/auth_cubit.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp.router(
        title: 'GoRouter MiddleWare',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
