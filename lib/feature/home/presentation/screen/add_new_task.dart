import 'package:flutter/material.dart';
import 'package:todo_task/config/firebase_utils.dart';
import 'package:todo_task/core/app_color.dart';
import 'package:todo_task/feature/home/data/task_model.dart';
import 'package:todo_task/feature/home/presentation/widget/custom_text_form_field.dart';

class AddNewTask extends StatefulWidget {
  static const String routeName = 'AddNewTask';

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  var formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  var taskNameController = TextEditingController();

  var descriptionController = TextEditingController();

  var categoryController = TextEditingController();

  var notificationController = TextEditingController();

  int color = 0xff4CCB41;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'New Task',
          style: TextStyle(
              color: AppColor.whiteColor, fontWeight: FontWeight.w300),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              'assets/images/aleart.png',
              width: size.width * .1,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black12),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please entre task name';
                  }
                  return null;
                },
                controller: taskNameController,
                hintText: 'Task Name',
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please entre description';
                  }
                  return null;
                },
                controller: descriptionController,
                hintText: 'Description',
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please entre category';
                  }
                  return null;
                },
                controller: categoryController,
                hintText: 'Category',
              ),
              Container(
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(color: AppColor.whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pick Date and Time',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showDate();
                      },
                      child: Text(
                        '${selectedDate.day}-${selectedDate.month}-${selectedDate.year} | '
                        '${selectedDate.hour} : ${selectedDate.minute} ',
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 15, bottom: 20),
                child: Text(
                  'Priority',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(color: AppColor.whiteColor),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        color = 0xffFC5565;
                      },
                      child: CircleAvatar(
                          backgroundColor: AppColor.redColor, radius: 10),
                    ),
                    InkWell(
                      onTap: () {
                        color = 0xffFA9B4A;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CircleAvatar(
                            backgroundColor: AppColor.yellowColor, radius: 10),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        color = 0xff58BBF7;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CircleAvatar(
                            backgroundColor: AppColor.blueColor, radius: 10),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        color = 0xff4CCB41;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CircleAvatar(
                            backgroundColor: AppColor.greenColor, radius: 10),
                      ),
                    ),
                  ],
                ),
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please entre notification';
                  }
                  return null;
                },
                controller: notificationController,
                hintText: 'Notification',
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    TaskModel taskModel = TaskModel(
                      taskName: taskNameController.text,
                      description: descriptionController.text,
                      category: categoryController.text,
                      date: selectedDate.millisecondsSinceEpoch,
                      notification: notificationController.text,
                      color: color,
                    );
                    addTaskToFirebase(taskModel).then(
                      (value) => Navigator.of(context).pop(),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(18),
                  backgroundColor: AppColor.primaryColor,
                ),
                child: Text(
                  'ADD',
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showDate() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
    }
    setState(() {});
  }
}
