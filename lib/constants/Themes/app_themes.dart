import 'package:flutter/material.dart';
import 'package:todo_app/constants/Themes/ThemeWidgets/tab_bar_theme.dart';
import 'package:todo_app/constants/Themes/ThemeWidgets/text_button_theme.dart';
import 'package:todo_app/constants/colors/app_colors.dart';
import 'package:todo_app/constants/themes/ThemeWidgets/bottom_navigation_bar_theme.dart';
import 'package:todo_app/constants/themes/ThemeWidgets/elevated_button_theme.dart';
import 'package:todo_app/constants/themes/ThemeWidgets/outlined_button_theme.dart';
import 'package:todo_app/constants/themes/ThemeWidgets/text_form_field_theme.dart';
import 'package:todo_app/constants/themes/ThemeWidgets/text_theme.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColors.primaryColorLight,
        secondary: AppColors.secondaryColorLight,
        background: AppColors.primaryColorLight,
        onPrimary: AppColors.primaryColorDark,
        onSurface: AppColors.textColorDark,
        surfaceVariant: AppColors.white,
        primaryContainer: AppColors.primaryColorDark,
        onPrimaryContainer: AppColors.primaryColorLight,
        secondaryContainer: Colors.green),
    dialogBackgroundColor: AppColors.primaryColorLight,
    primaryColor: AppColors.primaryColorLight,
    cardColor: AppColors.secondaryColorLight,
    scaffoldBackgroundColor: AppColors.primaryColorLight,
    textTheme: AppTextTheme.lightTextTheme,
    tabBarTheme: AppTabBarTheme.lightTabBarTheme,
    textButtonTheme: AppTextButtonTheme.lightTextButtonTheme,
    bottomNavigationBarTheme:
        AppBottomNavigationBarTheme.lightBottomNavigationBarTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightTextInputDecorationTheme,

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColors.primaryColorLight,
        elevation: 4,
        splashColor: AppColors.secondaryColorLight),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
        brightness: Brightness.dark,
        primary: AppColors.primaryColorDark,
        secondary: AppColors.secondaryColorDark,
        background: AppColors.primaryColorDark,
        onPrimary: AppColors.primaryColorLight,
        onSurface: AppColors.textColorDark,
        surfaceVariant: AppColors.black,
        onPrimaryContainer: AppColors.primaryColorDark,
        primaryContainer: AppColors.primaryColorLight,
        secondaryContainer: Colors.blue),
    dialogBackgroundColor: AppColors.primaryColorDark,
    primaryColor: AppColors.primaryColorDark,
    cardColor: AppColors.secondaryColorDark,
    scaffoldBackgroundColor: AppColors.primaryColorDark,
    textTheme: AppTextTheme.darkTextTheme,
    tabBarTheme: AppTabBarTheme.darkTabBarTheme,
    textButtonTheme: AppTextButtonTheme.darkTextButtonTheme,
    bottomNavigationBarTheme:
        AppBottomNavigationBarTheme.darkBottomNavigationBarTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AppTextFormFieldTheme.darkTextInputDecorationTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColors.primaryColorDark,
        elevation: 4,
        splashColor: AppColors.secondaryColorDark),
  );
}
