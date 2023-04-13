import 'package:equatable/equatable.dart';

class BaseToDoData extends Equatable {
  String taskName;
  String desc;
  String category;
  double time;
  String notification;

  BaseToDoData({
    required this.taskName,
    required this.desc,
    required this.category,
    required this.time,
    required this.notification,
  });

  @override
  List<Object?> get props => [taskName, desc, category, time, notification];
}
