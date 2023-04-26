import 'package:flutter/material.dart';
import 'package:todo_task/core/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  String? Function(String?)? validator;
  String hintText;
  TextEditingController controller;

  CustomTextFormField({
    required this.hintText,
    required this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: TextFormField(
        minLines: 1,
        maxLines: 4,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          filled: true,
          fillColor: AppColor.whiteColor,
        ),
      ),
    );
  }
}
