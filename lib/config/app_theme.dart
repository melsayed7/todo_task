import 'package:flutter/material.dart';
import 'package:todo_task/core/app_color.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primaryColor,
      elevation: 0,
    ),
  );
}
