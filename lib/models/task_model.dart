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

  TaskModel({
    this.id,
    required this.title,
    required this.status,
    required this.taskType,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json["id"],
    title: json["title"],
    status: json["status"],
    taskType: json["taskType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "taskType": taskType,
  };
}
