import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_task/config/app_theme.dart';
import 'package:todo_task/core/app_string.dart';
import 'package:todo_task/feature/home/presentation/screen/add_new_task.dart';
import 'package:todo_task/feature/home/presentation/screen/edit_task.dart';
import 'package:todo_task/feature/home/presentation/screen/task_details.dart';
import 'package:todo_task/feature/login/presentation/screen/login_screen.dart';

import 'bloc_observer.dart';
import 'feature/home/presentation/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppString.email = prefs.getString('email');
  AppString.password = prefs.getString('password');
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppString.email == null
          ? LoginScreen.routeName
          : HomeScreen.routeName,
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        AddNewTask.routeName: (_) => AddNewTask(),
        TaskDetails.routeName: (_) => TaskDetails(),
        EditTask.routeName: (_) => EditTask(),
      },
      theme: AppTheme.theme,
    );
  }
}


