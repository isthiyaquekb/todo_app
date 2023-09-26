import 'dart:convert';
import 'dart:io';

import 'package:todo_app/datasource/network/api_end_points.dart';
import 'package:todo_app/datasource/network/api_request_methods.dart';
import 'package:todo_app/datasource/network/network_client.dart';
import 'package:todo_app/models/task_model.dart';

enum TaskType { createTask, getTask, updateTask, deleteTask }

class TaskAPI implements APIRequestMethod {
  final TaskType type;
  int? taskId;
  String? password;
  TaskItem? taskItem;

  TaskAPI._({required this.type, this.password, this.taskId,this.taskItem});

  TaskAPI.getTask() : this._(type: TaskType.getTask);
  TaskAPI.addTask(TaskItem task) : this._(type: TaskType.createTask,taskItem: task);

  TaskAPI.deleteTask(int taskId) : this._(type: TaskType.deleteTask, taskId: 0);

  @override
  String get endpoint =>ApiEndPoints.devBaseUrl;

  @override
  String get path {
    switch (type) {
      case TaskType.getTask:
        return ApiEndPoints.getTask;
      case TaskType.createTask:
        return ApiEndPoints.createTask;
      case TaskType.updateTask:
        return "/updateTask";
      default:
        return "";
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case TaskType.getTask:
        return HTTPMethod.get;
      case TaskType.createTask:
        return HTTPMethod.post;
      case TaskType.updateTask:
        return HTTPMethod.put;
      default:
        return HTTPMethod.get;
    }
  }

  @override
  Map<String, String> get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  Map<String, String> get query {
    return {HttpHeaders.contentTypeHeader: 'application/json'};
  }

  @override
  get body {
    switch (type) {
      case TaskType.getTask:
        return null;
      case TaskType.createTask:
        return jsonEncode(taskItem!.toMap());
      case TaskType.updateTask:
        return null;
      default:
        return null;
    }
  }

  @override
  Future request() {
    return NetworkClient.instance.request(this);
  }

  @override
  String get url => endpoint + path;

}
