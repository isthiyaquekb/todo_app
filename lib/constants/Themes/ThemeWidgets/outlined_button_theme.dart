import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors/app_colors.dart';

class AppOutlinedButtonTheme{
  AppOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme=OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: AppColors.primaryColorLight,
      side: const BorderSide(color: AppColors.borderColors),
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),

    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: AppColors.primaryColorDark,
      side: const BorderSide(color: AppColors.inActiveColors),
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),

    ),
  );
}