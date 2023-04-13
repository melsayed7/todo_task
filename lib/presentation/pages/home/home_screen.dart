import 'package:flutter/material.dart';
import 'package:todo_task/core/app_color.dart';
import 'package:todo_task/presentation/widget/tab_section.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            'assets/images/menubar.png',
          ),
        ),
        title: Image.asset(
          'assets/images/logoTitle.png',
          width: size.width * .400,
        ),
        actions: [
          Image.asset(
            'assets/images/aleart.png',
            width: size.width * .1,
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(
                'assets/images/add_icon.png',
                width: size.width * .06,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
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
                    )),
              ),
            ),
          ),
          Expanded(
            child: tabSection(context),
          ),
        ],
      ),
    );
  }
}
