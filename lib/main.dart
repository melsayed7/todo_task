import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_task/core/app_theme.dart';
import 'package:todo_task/presentation/pages/add_new_task/add_new_task.dart';
import 'package:todo_task/presentation/pages/login/login_screen.dart';

import 'bloc_observer.dart';
import 'presentation/pages/home/home_screen.dart';

var email;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email');
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          email == null ? LoginScreen.routeName : HomeScreen.routeName,
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        AddNewTask.routeName: (_) => AddNewTask(),
      },
      theme: AppTheme.theme,
    );
  }
}


