import 'package:flutter/material.dart';
import 'package:todo_task/login_screen.dart';

void main() {
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


