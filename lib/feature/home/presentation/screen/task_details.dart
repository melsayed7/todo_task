import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_task/config/db_helper.dart';
import 'package:todo_task/feature/home/presentation/cubit/cubit.dart';
import 'package:todo_task/feature/home/presentation/cubit/states.dart';
import 'package:todo_task/feature/home/presentation/screen/edit_task.dart';

import '../../../../core/app_color.dart';
import '../../data/task_model.dart';
import 'add_new_task.dart';

class TaskDetails extends StatelessWidget {
  static const String routeName = 'TaskDetails';
  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as TaskModel;
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: BlocConsumer<TaskCubit, TaskStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              title: const Text(
                'Task Details',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
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
            body: Container(
              color: Colors.black12,
              height: double.infinity,
              child: Stack(
                children: [
                  Container(
                    color: AppColor.primaryColor,
                    height: size.height * .15,
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
                  ),
                  Positioned(
                    top: size.height * .09,
                    left: size.width * .01,
                    right: size.width * .01,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              args.taskName,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Text(
                            '${DateFormat('d MMM, yyyy').format(DateTime.fromMillisecondsSinceEpoch(args.date))} | ${args.time}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            args.description,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Category : ${args.category}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: AppColor.whiteColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                TaskCubit.get(context).deleteDatabase(args.id!);
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    EditTask.routeName,
                                    arguments: args);
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.access_time)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.done_sharp)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
