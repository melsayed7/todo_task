import 'package:flutter/material.dart';
import 'package:todo_task/config/firebase_utils.dart';
import 'package:todo_task/core/app_color.dart';
import 'package:todo_task/feature/home/presentation/screen/show_daily_tasks.dart';

Widget tabSection(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return DefaultTabController(
    length: 3,
    child: Column(
      children: [
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
        Expanded(
          child: SizedBox(
            child: TabBarView(children: [
              StreamBuilder(
                stream: getDataFromFirebase(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    const Center(child: CircularProgressIndicator());
                  }
                  var tasks =
                      snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ShowDailyTasks(taskModel: tasks[index]);
                    },
                    itemCount: tasks.length,
                  );
                },
              ),
              const Text("WEEKLY Body"),
              const Text("MONTHLY Body"),
            ]),
          ),
        ),
      ],
    ),
  );
}
