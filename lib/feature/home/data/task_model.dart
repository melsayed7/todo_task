class TaskModel {
  String id;
  String taskName;
  String description;
  String category;
  int date;
  String time;
  String notification;
  int color;

  TaskModel({
    this.id = '',
    required this.taskName,
    required this.description,
    required this.category,
    required this.date,
    required this.time,
    required this.notification,
    required this.color,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
    id: json['id'] as String,
          taskName: json['taskName'] as String,
          description: json['description'] as String,
          category: json['category'] as String,
          date: json['date'] as int,
          time: json['time'] as String,
          notification: json['notification'] as String,
          color: json['color'] as int,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskName': taskName,
      'description': description,
      'category': category,
      'date': date,
      'time': time,
      'notification': notification,
      'color': color,
    };
  }
}
