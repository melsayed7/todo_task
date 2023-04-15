import 'package:flutter/material.dart';
import 'package:todo_task/feature/home/presentation/screen/add_new_task.dart';
import 'package:todo_task/feature/home/presentation/widget/custom_container.dart';
import 'package:todo_task/feature/home/presentation/widget/tab_section.dart';

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
            onTap: () {
              Navigator.of(context).pushNamed(AddNewTask.routeName);
            },
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
          CustomContainer(),
          Expanded(
            child: tabSection(context),
          ),
        ],
      ),
    );
  }
}
