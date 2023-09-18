import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors/app_colors.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: AppColors.primaryColorLight,
      backgroundColor: AppColors.secondaryColorLight,
      side: const BorderSide(color: AppColors.borderColors),
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),
    )
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          foregroundColor: AppColors.primaryColorDark,
          backgroundColor: AppColors.secondaryColorDark,
          side: const BorderSide(color: AppColors.borderColors),
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),
      )
  );
}
