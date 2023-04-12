import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  Widget icon;

  String hintText;

  TextEditingController controller;

  String? Function(String?)? validator;

  TextInputType inputType;

  bool obscureText;

  CustomTextFormField({
    required this.icon,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.inputType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          prefixIcon: icon,
          hintText: hintText,
        ),
      ),
    );
  }
}
