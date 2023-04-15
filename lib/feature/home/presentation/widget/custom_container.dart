import 'package:flutter/material.dart';

import '../../../../core/app_color.dart';

class CustomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .10,
      decoration: BoxDecoration(color: AppColor.primaryColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search Task',
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/search.png',
                width: size.width * .01,
              ),
            ),
            fillColor: AppColor.whiteColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
