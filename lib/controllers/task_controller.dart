import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  var selectedTime = "".obs;
  var pickedTime = "".obs;
  var taskType = "Work".obs;

  @override
  void onInit() {
    initialDate = DateTime.now();
    selectedDate.value = DateFormat('EEEE d,MMMM').format(initialDate);
    selectedTime.value = DateTimeFormatter.formatTimeOfDay(initialTime);
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
    if (isTaskValid.value) {
      saveTaskInDB(
          TaskModel(title: taskEditController.text, status: false, taskType: taskType.value,taskDate: pickedDate.value,taskTime: pickedTime.value,reminder: reminderOn.value));
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
      pickedDate.value=picked.toString();
      selectedDate.value = DateFormat('EEEE d,MMMM').format(picked);
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
      pickedTime.value= DateTime(now.year, now.month, now.day, picked.hour, picked.minute).toString();
      selectedTime.value = DateTimeFormatter.formatTimeOfDay(picked);
    }
    update();
  }

  // ADD TASK
  void saveTaskInDB(TaskModel taskModel) async {
    log("XXXX TASK TITLE XXX :${taskModel.title}");
    log("XXXX TASK TYPE XXX :${taskModel.taskType}");
    log("XXXX TASK DATE XXX :${taskModel.taskDate}");
    log("XXXX TASK TIME XXX :${taskModel.taskTime}");
    log("XXXX TASK TIME XXX :${taskModel.taskTime}");
    log("SAVE THIS TO DB:${taskModel.toJson()}");
  }

// UPDATE TASK
// DELETE TASK

}
