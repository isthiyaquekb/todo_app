// To parse this JSON data, do
//
//     final taskModel = taskModelFromMap(jsonString);

import 'dart:convert';

TaskModel taskModelFromMap(String str) => TaskModel.fromMap(json.decode(str));

String taskModelToMap(TaskModel data) => json.encode(data.toMap());

class TaskModel {
  final List<TaskItem> data;
  final String message;
  final String status;

  TaskModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory TaskModel.fromMap(Map<String, dynamic> json) => TaskModel(
    data: List<TaskItem>.from(json["data"].map((x) => TaskItem.fromMap(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "message": message,
    "status": status,
  };
}

class TaskItem {
  final int? id;
  final String title;
  final bool status;
  final String taskType;
  final String taskDate;
  final String taskFromTime;
  final String taskToTime;
  final bool reminder;

  TaskItem({
    this.id,
    required this.title,
    required this.status,
    required this.taskType,
    required this.taskDate,
    required this.taskFromTime,
    required this.taskToTime,
    required this.reminder,
  });

  factory TaskItem.fromMap(Map<String, dynamic> json) => TaskItem(
    id: json["id"],
    title: json["title"],
    status: json["status"] == 0 ?false:true,
    taskType: json["taskType"],
    taskDate: json["taskDate"],
    taskFromTime: json["taskFromTime"],
    taskToTime: json["taskToTime"],
    reminder: json["reminder"] == 0 ?false:true,
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "status": status,
    "taskType": taskType,
    "taskDate": taskDate,
    "taskFromTime": taskFromTime,
    "taskToTime": taskToTime,
    "reminder": reminder,
  };
}
