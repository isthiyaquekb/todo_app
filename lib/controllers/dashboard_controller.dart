import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/constants/AppKeys/app_keys.dart';
import 'package:todo_app/constants/Themes/app_themes.dart';

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin{

  final storageBox = GetStorage();
  var isDarkMode = false.obs;

  var selectedIndex=0.obs;
  var selectedTabIndex = 0;


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

  ];

  late TabController tabController;
  @override
  void onInit() {
    tabController=TabController(length: myTabs.length,vsync: this,initialIndex: 0);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
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
    selectedTabIndex=index;
    update();
  }
}