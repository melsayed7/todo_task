import 'package:flutter/material.dart';
import 'package:todo_task/core/app_color.dart';
import 'package:todo_task/feature/home/data/task_model.dart';
import 'package:todo_task/feature/home/presentation/screen/task_details.dart';

class ShowDailyTasks extends StatelessWidget {
  TaskModel taskModel;

  ShowDailyTasks({required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(TaskDetails.routeName, arguments: taskModel);
      },
      child: Container(
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
                      taskModel.time,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .1,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    taskModel.taskName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
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
                    backgroundColor: Color(taskModel.color),
                    radius: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
