import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.quantico(
        color: Colors.black87,
        fontSize: 24,
        fontWeight: FontWeight.w700
    ),
    headline2: GoogleFonts.quantico(
        color: Colors.black87,
        fontSize: 34,
        fontWeight: FontWeight.w700
    ),
    subtitle1: GoogleFonts.quantico(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.w400
    ),
    subtitle2: GoogleFonts.quantico(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.w400
    ),
    button: GoogleFonts.quantico(
      color: AppColors.textColorLight,
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),
    bodyText1: GoogleFonts.quantico(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.normal
    ),
    bodyText2: GoogleFonts.quantico(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.normal
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.quantico(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.w700
    ),
    headline2: GoogleFonts.quantico(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w700
    ),
    subtitle1: GoogleFonts.quantico(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400
    ),
    subtitle2: GoogleFonts.quantico(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400
    ),
    button: GoogleFonts.quantico(
        color: AppColors.textColorDark,
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),
    bodyText1: GoogleFonts.quantico(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.normal
    ),
    bodyText2: GoogleFonts.quantico(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.normal
    ),
  );
}