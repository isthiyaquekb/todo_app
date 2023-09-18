import 'package:get/get.dart';
import 'package:todo_app/controllers/task_controller.dart';

class TaskBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(TaskController());
  }


}