import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_task/core/app_color.dart';
import 'package:todo_task/feature/home/data/task_model.dart';

class ShowDailyTasks extends StatelessWidget {
  TaskModel taskModel;

  ShowDailyTasks({required this.taskModel});

  @override
  Widget build(BuildContext context) {
    var showTime = DateFormat('hh')
        .format(DateTime.fromMicrosecondsSinceEpoch(taskModel.date));

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(color: AppColor.whiteColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    showTime,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    'AM',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .1,
              ),
              Column(children: [
                Text(
                  taskModel.taskName,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w400),
                ),
                Text(
                  taskModel.category,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ]),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.star_border,
                weight: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: CircleAvatar(
                  backgroundColor: AppColor.yellowColor,
                  radius: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
