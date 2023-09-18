import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/constants/AppKeys/app_keys.dart';

class ThemeService {
  final storageBox = GetStorage();

  //Initial Theme will be light, isDark will be false
  bool initialTheme() => storageBox.read(AppKeys.keyIsDark) ?? false;

  //ThemeMode
  ThemeMode get themeMode => initialTheme() ? ThemeMode.dark : ThemeMode.light;

  // SET THEME or CHANGE THEME

  void setThemeMode() {
    Get.changeThemeMode(initialTheme()?ThemeMode.light:ThemeMode.dark);
    changeTheme(!initialTheme());
  }

  //CHANGE THEME
  void changeTheme(bool isDark) {
    log("THEME MODE DARK IS $isDark");
    storageBox.write(AppKeys.keyIsDark, isDark);
  }
}
