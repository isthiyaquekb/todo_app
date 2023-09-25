// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

List<TaskModel> taskModelFromJson(String str) => List<TaskModel>.from(json.decode(str).map((x) => TaskModel.fromJson(x)));

String taskModelToJson(List<TaskModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskModel {
  int? id;
  String title;
  bool status;
  String taskType;
  String taskDate;
  String taskTime;
  bool reminder;

  TaskModel({
    this.id,
    required this.title,
    required this.status,
    required this.taskType,
    required this.taskDate,
    required this.taskTime,
    required this.reminder,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json["id"],
    title: json["title"],
    status: json["status"],
    taskType: json["taskType"],
    taskDate: json["taskDate"],
    taskTime: json["taskTime"],
    reminder: json["reminder"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "status": status,
    "taskType": taskType,
    "taskDate": taskDate,
    "taskTime": taskTime,
    "reminder": reminder,
  };
}
