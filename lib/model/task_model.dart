class TaskModel {
  String id;
  String taskName;
  String description;
  String category;
  int date;
  String notification;

  TaskModel({
    this.id = '',
    required this.taskName,
    required this.description,
    required this.category,
    required this.date,
    required this.notification,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          taskName: json['taskName'] as String,
          description: json['description'] as String,
          category: json['category'] as String,
          date: json['date'] as int,
          notification: json['notification'] as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskName': taskName,
      'description': description,
      'category': category,
      'date': date,
      'notification': notification,
    };
  }
}
