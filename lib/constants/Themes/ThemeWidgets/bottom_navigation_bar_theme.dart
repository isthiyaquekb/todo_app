import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors/app_colors.dart';

class AppBottomNavigationBarTheme {
  AppBottomNavigationBarTheme._();

  static const lightBottomNavigationBarTheme = BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColorLight,
      elevation: 4,
      selectedIconTheme: IconThemeData(color: AppColors.secondaryColorLight),
      unselectedIconTheme: IconThemeData(color: AppColors.inActiveColors),

  );
  static const darkBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: AppColors.primaryColorDark,
    elevation: 4,
    selectedIconTheme: IconThemeData(color: AppColors.secondaryColorDark),
    unselectedIconTheme: IconThemeData(color: AppColors.inActiveColors),

  );
}
