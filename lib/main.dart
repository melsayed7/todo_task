import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_task/config/app_theme.dart';
import 'package:todo_task/feature/home/presentation/screen/add_new_task.dart';
import 'package:todo_task/feature/home/presentation/screen/task_details.dart';
import 'package:todo_task/feature/login/presentation/screen/login_screen.dart';

import 'bloc_observer.dart';
import 'feature/home/presentation/screen/home_screen.dart';

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
        TaskDetails.routeName: (_) => TaskDetails(),
      },
      theme: AppTheme.theme,
    );
  }
}


