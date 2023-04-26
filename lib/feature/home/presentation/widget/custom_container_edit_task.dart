import 'package:flutter/material.dart';

import '../../../../core/app_color.dart';

class CustomContainerEditTask extends StatelessWidget {
  String text;

  String? Function(String?)? validator;
  TextEditingController controller;

  CustomContainerEditTask({
    required this.text,
    required this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.whiteColor),
      margin: const EdgeInsets.only(bottom: .75),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 11, top: 10),
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
          ),
          TextFormField(
            minLines: 1,
            maxLines: 4,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: AppColor.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
