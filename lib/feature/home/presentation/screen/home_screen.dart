import 'package:flutter/material.dart';
import 'package:todo_task/config/db_helper.dart';
import 'package:todo_task/feature/home/presentation/screen/add_new_task.dart';
import 'package:todo_task/feature/home/presentation/screen/show_daily_tasks.dart';
import 'package:todo_task/feature/home/presentation/widget/custom_container.dart';

import '../../../../core/app_color.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelper dbHelper = DBHelper();

  late Future getData;

  @override
  void initState() {
    super.initState();
    getData = dbHelper.getDataList();
  }

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
            child: DefaultTabController(
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
                      child: TabBarView(
                        children: [
                          FutureBuilder(
                            future: getData,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData || snapshot.data == null) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.data!.isEmpty) {
                                return Center(
                                  child: Text(
                                    'No Task Found',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                  itemBuilder: (context, index) {
                                    return ShowDailyTasks(
                                        taskModel: snapshot.data![index]);
                                  },
                                  itemCount: snapshot.data!.length,
                                );
                              }
                            },
                          ),
                          const Center(child: Text("WEEKLY Body")),
                          const Center(child: Text("MONTHLY Body")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
