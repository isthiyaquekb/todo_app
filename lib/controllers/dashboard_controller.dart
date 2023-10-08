import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/AppKeys/app_keys.dart';
import 'package:todo_app/constants/Themes/app_themes.dart';
import 'package:todo_app/datasource/local/database_helper.dart';
import 'package:todo_app/datasource/network/api_request_methods.dart';
import 'package:todo_app/datasource/network/network_client.dart';
import 'package:todo_app/datasource/network/task_api.dart';
import 'package:todo_app/models/task_model.dart';

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin{

  final storageBox = GetStorage();
  var isDarkMode = false.obs;

  var selectedIndex=0.obs;
  var selectedTabIndex = 0.obs;
  var selectedMonthTabIndex = 0.obs;
  var taskList=<TaskItem>[].obs;
  var filterTaskList=<TaskItem>[].obs;
  final pages = [

  ];

  final List<Tab> myTabs = const <Tab>[
    Tab(text: 'Monday'),
    Tab(text: 'Tuesday'),
    Tab(text: 'Wednesday'),
    Tab(text: 'Thursday'),
    Tab(text: 'Friday'),
    Tab(text: 'Saturday'),
    Tab(text: 'Sunday'),

  ].obs;

  final List<Tab> myMonth = const <Tab>[
    Tab(text: 'Jan'),
    Tab(text: 'Feb'),
    Tab(text: 'Mar'),
    Tab(text: 'Apr'),
    Tab(text: 'May'),
    Tab(text: 'Jun'),
    Tab(text: 'Jul'),
    Tab(text: 'Aug'),
    Tab(text: 'Sep'),
    Tab(text: 'Oct'),
    Tab(text: 'Nov'),
    Tab(text: 'Dec'),

  ].obs;

  late TabController tabController;
  @override
  void onInit() {
    getTaskFromDB();
    super.onInit();
    tabController=TabController(length: myTabs.length,vsync: this,initialIndex: 0);
    tabController.addListener((){
      selectedTabIndex.value = tabController.index;
    });
    update();

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    // getAllTask();
    getTaskFromDB();
    super.onReady();
  }

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    if (isDarkMode.value) {
      log("THEME DARK");
      Get.changeThemeMode(ThemeMode.dark);
      storageBox.write(AppKeys.keyIsDark, isDarkMode.value);
    } else {
      log("THEME LIGHT");
      Get.changeThemeMode(ThemeMode.light);
      storageBox.write(AppKeys.keyIsDark, isDarkMode.value);
    }
    update();
  }

  void changeIndex(int index){
    selectedIndex.value=index;
    update();
  }

  void changeTabIndex(int index){
    selectedTabIndex.value=index;
    filterTaskByDay(myTabs[index].text.toString());
    update();
  }

  void changeMonthTabIndex(int index){
    selectedMonthTabIndex.value=index;

    update();
  }

  //GET TASK ON HOME
  void getAllTask()async {
    try{
      var response = await  TaskAPI.getTask().request();
      if(response!=null){
        log("RESP =>${response.toString()}");
        var responseTask=TaskModel.fromMap(response);
        if(responseTask.data.isNotEmpty){
          taskList.value=responseTask.data;
        }
        log("TASK LIST LENGTH:${taskList.length}");
        update();
      }

    }catch(e){

      log("EXCEPTION:${e.toString()}");
    }
  }

  void filterTaskByDay(String day){
    // Filter the list based on the specified day
    filterTaskList.value = taskList.where((task) {
      final taskDate = DateTime.parse(task.taskDate);
      // Get the day of the week as a string (e.g., "Monday")
      final dayOfWeek = DateFormat('EEEE').format(DateTime.parse(taskDate.toLocal().toString().split(' ')[0]));
      return dayOfWeek == day;
    }).toList();
    // Print the filtered list
    for (final task in filterTaskList) {
      print('Title: ${task.title}, Task Date: ${task.taskDate} , STATUS: ${task.status}');
    }
  }

  void getTaskFromDB() async {
    var queryTaskDB = await DatabaseHelper.readTaskQuery();
   if(queryTaskDB!=null) {
     taskList.assignAll(queryTaskDB.map((e) => TaskItem.fromMap(e)).toList());
   }
    log('taskList: ${taskList.length}');
    update();
  }
}