import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/Colors/app_colors.dart';

class AppTextButtonTheme {
  AppTextButtonTheme._();
  static final lightTextButtonTheme=TextButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: AppColors.textColorDark,
      textStyle: GoogleFonts.sofiaSans(
          fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.primaryColorLight
      ),
      side: const BorderSide(color: AppColors.borderColors),
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),

    ),
  );

  static final darkTextButtonTheme=TextButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: AppColors.redColors,
      textStyle: GoogleFonts.sofiaSans(
        fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.primaryColorDark
      ),
      side: const BorderSide(color: AppColors.borderColors),
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),

    ),
  );
}