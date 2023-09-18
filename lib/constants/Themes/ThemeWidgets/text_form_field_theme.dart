import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors/app_colors.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();

  static InputDecorationTheme lightTextInputDecorationTheme = InputDecorationTheme(
    labelStyle: GoogleFonts.quantico(color: AppColors.textColorLight,fontSize: 14,fontWeight: FontWeight.w400),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: AppColors.inActiveColors,width: 1),
    ),
    floatingLabelStyle: const TextStyle(color: AppColors.textColorLight),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
          color: AppColors.inActiveColors, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: AppColors.inActiveColors),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
          color: AppColors.inActiveColors, width: 1),
    ),
  );
  static InputDecorationTheme darkTextInputDecorationTheme = InputDecorationTheme(
    labelStyle: GoogleFonts.quantico(color: AppColors.textColorDark,fontSize: 14,fontWeight: FontWeight.w400),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: AppColors.inActiveColors,width: 1),
    ),
    floatingLabelStyle: const TextStyle(color: AppColors.textColorDark),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
          color: AppColors.inActiveColors, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: AppColors.inActiveColors),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
          color: AppColors.inActiveColors, width: 1),
    ),
  );
}
