import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/values.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,

    textTheme: GoogleFonts.manropeTextTheme(),
    //Escolhi manrope devido à modernidade e traços fáceis de identificar

    scaffoldBackgroundColor:
        CustomColors.background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: CustomColors.primary,
    ),

    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 2,
      backgroundColor: CustomColors.background,
      titleTextStyle: GoogleFonts.manrope(
        fontSize: Values.fontSize.mediumLarge!,
        fontWeight: FontWeight.w700,
        color: CustomColors.font,
      ),
    ),
  );
}