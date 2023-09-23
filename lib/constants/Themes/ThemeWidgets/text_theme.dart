import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.sofiaSans(
        color: Colors.black87,
        fontSize: 34,
        fontWeight: FontWeight.w700
    ),
    displayMedium: GoogleFonts.sofiaSans(
        color: Colors.black87,
        fontSize: 24,
        fontWeight: FontWeight.w700
    ),
    displaySmall: GoogleFonts.sofiaSans(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.w400
    ),
    titleLarge: GoogleFonts.sofiaSans(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.w400
    ),
    titleMedium: GoogleFonts.sofiaSans(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.w400
    ),
    titleSmall: GoogleFonts.sofiaSans(
        color: Colors.black87,
        fontSize: 12,
        fontWeight: FontWeight.w400
    ),

    labelMedium: GoogleFonts.sofiaSans(
      color: AppColors.textColorLight,
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),
    labelSmall: GoogleFonts.sofiaSans(
        color: AppColors.textColorLight,
        fontSize: 14,
        fontWeight: FontWeight.w600
    ),
    bodyLarge: GoogleFonts.sofiaSans(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.normal
    ),
    bodyMedium: GoogleFonts.sofiaSans(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.normal
    ),
    bodySmall: GoogleFonts.sofiaSans(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.normal
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.sofiaSans(
        color: AppColors.textColorLight,
        fontSize: 34,
        fontWeight: FontWeight.w700
    ),
    displayMedium: GoogleFonts.sofiaSans(
        color: AppColors.textColorLight,
        fontSize: 24,
        fontWeight: FontWeight.w700
    ),
    displaySmall: GoogleFonts.sofiaSans(
        color: AppColors.textColorLight,
        fontSize: 20,
        fontWeight: FontWeight.w400
    ),
    titleLarge: GoogleFonts.sofiaSans(
        color: AppColors.textColorLight,
        fontSize: 16,
        fontWeight: FontWeight.w400
    ),
    titleMedium: GoogleFonts.sofiaSans(
        color: AppColors.textColorLight,
        fontSize: 14,
        fontWeight: FontWeight.w400
    ),
    titleSmall: GoogleFonts.sofiaSans(
        color: AppColors.textColorLight,
        fontSize: 12,
        fontWeight: FontWeight.w400
    ),
    labelMedium: GoogleFonts.sofiaSans(
        color: AppColors.textColorLight,
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),
    labelSmall: GoogleFonts.sofiaSans(
        color: AppColors.textColorLight,
        fontSize: 14,
        fontWeight: FontWeight.w600
    ),
    bodyLarge: GoogleFonts.sofiaSans(
        color: AppColors.textColorLight,
        fontSize: 18,
        fontWeight: FontWeight.normal
    ),
    bodyMedium: GoogleFonts.sofiaSans(
        color: AppColors.textColorLight,
        fontSize: 16,
        fontWeight: FontWeight.normal
    ),
    bodySmall: GoogleFonts.sofiaSans(
        color: AppColors.textColorLight,
        fontSize: 14,
        fontWeight: FontWeight.normal
    ),
  );
}