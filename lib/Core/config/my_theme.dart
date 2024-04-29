import 'package:easy_hr/Core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(color: AppColors.secondColorBlue),
    textTheme: TextTheme(
  bodySmall: GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  bodyMedium: GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
  headlineMedium: GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  ),
));
