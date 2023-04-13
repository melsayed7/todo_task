import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/presentation/pages/login_screen.dart';

import 'bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName : (_) => LoginScreen(),
      },
    );
  }
}


