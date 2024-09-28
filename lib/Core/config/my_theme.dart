import 'package:easy_hr/Core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: AppColors.primaryColorGrey,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColorGrey),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
    ),
  ),
);
