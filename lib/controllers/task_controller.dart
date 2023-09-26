import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controllers/dashboard_controller.dart';
import 'package:todo_app/datasource/network/task_api.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/utils/date_time_formatter.dart';

class TaskController extends GetxController {
  var taskEditController = TextEditingController();
  var taskFormKey = GlobalKey<FormState>();
  var isExpanded = false.obs;
  var reminderOn = false.obs;
  var isTaskValid = false.obs;
  DateTime initialDate = DateTime.now();
  TimeOfDay initialTime = TimeOfDay.now();
  var selectedDate = "".obs;
  var pickedDate = "".obs;
  var selectedFromTime = "".obs;
  var selectedToTime = "".obs;
  var pickedFromTime = "".obs;
  var pickedToTime = "".obs;
  var taskType = "Work".obs;

  @override
  void onInit() {
    initialDate = DateTime.now();
    // selectedDate.value = DateFormat('EEEE d,MMMM').format(initialDate);
    // selectedTime.value = DateTimeFormatter.formatTimeOfDay(initialTime);
    taskEditController = TextEditingController();
    // GET ALL TASK
    log("TIME NOW:${DateTime.now()}");
    super.onInit();
  }

  @override
  void dispose() {
    taskEditController.dispose();
    super.dispose();
  }

  //EXPAND
  void expandBox() {
    isExpanded.value = !isExpanded.value;
    update();
  }

  void setTaskType(String type) {
    taskType.value = type;
    log("TYPE:${taskType.value}");
    update();
  }

  void isValid() {
    isTaskValid.value = taskFormKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isTaskValid.value && pickedDate.isNotEmpty && pickedFromTime.isNotEmpty && pickedToTime.isNotEmpty) {
      saveTaskInDB(TaskItem(
          title: taskEditController.text,
          status: false,
          taskType: taskType.value,
          taskDate: pickedDate.value,
          taskFromTime: pickedFromTime.value,
          taskToTime: pickedToTime.value,
          reminder: reminderOn.value));
    }
  }

  String? isTaskValidator(String number) {
    if (number.isEmpty) {
      return "Please enter a task";
    }
    return null;
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != initialDate) {
      pickedDate.value = picked.toString();
      selectedDate.value.isEmpty?selectedDate.value = DateFormat('EEEE d,MMMM').format(picked):selectedDate.value ="Pick a date";
    }
    update();
  }

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: initialTime,
        initialEntryMode: TimePickerEntryMode.dialOnly,
        orientation: Orientation.portrait);
    if (picked != null && picked != initialTime) {
      final now = DateTime.now();
      pickedFromTime.value.isNotEmpty
          ? pickedToTime.value =
              DateTime(now.year, now.month, now.day, picked.hour, picked.minute)
                  .toString()
          : pickedFromTime.value =
              DateTime(now.year, now.month, now.day, picked.hour, picked.minute)
                  .toString();
      selectedFromTime.value.isNotEmpty
          ? selectedToTime.value = DateTimeFormatter.formatTimeOfDay(picked)
          : selectedFromTime.value = DateTimeFormatter.formatTimeOfDay(picked);
    }
    update();
  }

  // ADD TASK
  void saveTaskInDB(TaskItem taskModel) async {
    log("XXXX TASK TITLE XXX :${taskModel.title}");
    log("XXXX TASK TYPE XXX :${taskModel.taskType}");
    log("XXXX TASK DATE XXX :${taskModel.taskDate}");
    log("XXXX TASK FROM TIME XXX :${taskModel.taskFromTime}");
    log("XXXX TASK TO TIME XXX :${taskModel.taskToTime}");
    log("SAVE THIS TO DB:${taskModel.toMap()}");

    try {
      var response = await TaskAPI.addTask(taskModel).request();
      if (response != null) {
        log("ADD RESP =>${response.toString()}");
        Get.find<DashboardController>().getAllTask();
        Get.back();
      }
    } catch (e) {
      throw e.toString();
    }
  }

// UPDATE TASK
// DELETE TASK
}
