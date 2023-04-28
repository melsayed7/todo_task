import 'package:flutter/material.dart';
import 'package:todo_task/config/firebase_utils.dart';
import 'package:todo_task/core/app_color.dart';
import 'package:todo_task/feature/home/data/task_model.dart';
import 'package:todo_task/feature/home/presentation/screen/home_screen.dart';
import 'package:todo_task/feature/home/presentation/widget/custom_container_edit_task.dart';

class EditTask extends StatefulWidget {
  static const String routeName = 'EditTask';

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay.now();

  var taskNameController = TextEditingController();

  var descriptionController = TextEditingController();

  var categoryController = TextEditingController();

  var notificationController = TextEditingController();

  int color = 0xff4CCB41;

  late TaskModel args;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      args = ModalRoute.of(context)?.settings.arguments as TaskModel;
      taskNameController.text = args.taskName;
      descriptionController.text = args.description;
      categoryController.text = args.category;
      notificationController.text = args.notification;
      color = args.color;
      selectedDate = DateTime.fromMicrosecondsSinceEpoch(args.date);
      selectedTime = TimeOfDay(
          hour: int.parse(args.time.split(":")[0]),
          minute: int.parse(args.time.split(":")[0]));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Edit Task',
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
              CustomContainerEditTask(
                text: 'Task Name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please entre task name';
                  }
                  return null;
                },
                controller: taskNameController,
              ),
              CustomContainerEditTask(
                text: 'Description',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please entre description';
                  }
                  return null;
                },
                controller: descriptionController,
              ),
              CustomContainerEditTask(
                text: 'Category',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please entre category';
                  }
                  return null;
                },
                controller: categoryController,
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
                        '${selectedDate.day}-${selectedDate.month}-${selectedDate.year} |'
                        ' ${selectedTime.format(context)}',
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
                        setState(() {});
                      },
                      child: color == 0xffFC5565
                          ? Stack(
                              children: [
                                CircleAvatar(
                                    backgroundColor: AppColor.redColor,
                                    radius: 10),
                                const CircleAvatar(
                                    backgroundColor: Colors.black26,
                                    radius: 10,
                                    child: Icon(
                                      Icons.check,
                                      size: 20,
                                    )),
                              ],
                            )
                          : CircleAvatar(
                              backgroundColor: AppColor.redColor, radius: 10),
                    ),
                    InkWell(
                      onTap: () {
                        color = 0xffFA9B4A;
                        setState(() {});
                      },
                      child: color == 0xffFA9B4A
                          ? Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: CircleAvatar(
                                      backgroundColor: AppColor.yellowColor,
                                      radius: 10),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.black26,
                                      radius: 10,
                                      child: Icon(
                                        Icons.check,
                                        size: 20,
                                      )),
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CircleAvatar(
                                  backgroundColor: AppColor.yellowColor,
                                  radius: 10),
                            ),
                    ),
                    InkWell(
                      onTap: () {
                        color = 0xff58BBF7;
                        setState(() {});
                      },
                      child: color == 0xff58BBF7
                          ? Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: CircleAvatar(
                                      backgroundColor: AppColor.blueColor,
                                      radius: 10),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.black26,
                                      radius: 10,
                                      child: Icon(
                                        Icons.check,
                                        size: 20,
                                      )),
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CircleAvatar(
                                  backgroundColor: AppColor.blueColor,
                                  radius: 10),
                            ),
                    ),
                    InkWell(
                      onTap: () {
                        color = 0xff4CCB41;
                        setState(() {});
                      },
                      child: color == 0xff4CCB41
                          ? Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: CircleAvatar(
                                      backgroundColor: AppColor.greenColor,
                                      radius: 10),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.black26,
                                      radius: 10,
                                      child: Icon(
                                        Icons.check,
                                        size: 20,
                                      )),
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CircleAvatar(
                                  backgroundColor: AppColor.greenColor,
                                  radius: 10),
                            ),
                    ),
                  ],
                ),
              ),
              CustomContainerEditTask(
                text: 'Notification',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please entre notification';
                  }
                  return null;
                },
                controller: notificationController,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    args.taskName = taskNameController.text;
                    args.description = descriptionController.text;
                    args.category = categoryController.text;
                    args.notification = notificationController.text;
                    args.date = selectedDate.microsecondsSinceEpoch;
                    args.color = color;
                    updateTaskFromFirebase(args).timeout(
                      const Duration(microseconds: 500),
                      onTimeout: () {
                        Navigator.of(context)
                            .popAndPushNamed(HomeScreen.routeName);
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(18),
                  backgroundColor: AppColor.primaryColor,
                ),
                child: Text(
                  'EDIT',
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
      firstDate: selectedDate,
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
    }
    var chosenTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (chosenTime != null) {
      selectedTime = chosenTime;
    }
    setState(() {});
  }
}
