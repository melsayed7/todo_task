import 'package:flutter/material.dart';
import 'package:todo_task/core/app_color.dart';

Widget tabSection(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return DefaultTabController(
    length: 3,
    child: Column(
      children: <Widget>[
        Container(
          height: size.height * .04,
          decoration: BoxDecoration(color: AppColor.primaryColor),
          child: const TabBar(
            tabs: [
              Tab(text: "DAILY"),
              Tab(text: "WEEKLY"),
              Tab(text: "MONTHLY"),
            ],
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            indicatorColor: Colors.white,
          ),
        ),
        const Expanded(
          child: SizedBox(
            child: TabBarView(children: [
              Text("DAILY Body"),
              Text("WEEKLY Body"),
              Text("MONTHLY Body"),
            ]),
          ),
        ),
      ],
    ),
  );
}
