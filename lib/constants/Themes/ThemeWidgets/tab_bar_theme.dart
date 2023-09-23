import 'package:flutter/material.dart';
import 'package:todo_app/constants/Colors/app_colors.dart';

class AppTabBarTheme {
  AppTabBarTheme._();
  static TabBarTheme lightTabBarTheme = TabBarTheme(
    labelColor: AppColors.primaryColorLight,
    unselectedLabelColor: AppColors.black,
    unselectedLabelStyle: const TextStyle(color: AppColors.black),
    indicator: BoxDecoration(
        color: AppColors.primaryColorDark,
        borderRadius: BorderRadius.circular(10)),
    indicatorColor: Colors.black,
  );

  static TabBarTheme darkTabBarTheme = TabBarTheme(
    labelColor: AppColors.primaryColorDark,
    unselectedLabelColor: AppColors.white,
    unselectedLabelStyle: const TextStyle(color: AppColors.white),
    indicator: BoxDecoration(
        color: AppColors.primaryColorLight,
        borderRadius: BorderRadius.circular(10)),
    indicatorColor: Colors.white,
  );
}