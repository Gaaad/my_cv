import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class AppTheme {
  static lightTheme() {
    return ThemeData.light().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: MyColors.myDark,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateColor.resolveWith(
            (states) => MyColors.myYellow,
          ),
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => Colors.white.withOpacity(0.1),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          textStyle: MaterialStatePropertyAll(
            GoogleFonts.anekBangla(
              textStyle: const TextStyle(
                fontSize: 15,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(MyColors.myYellow),
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.alegreya(
          textStyle: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
            color: MyColors.myWhite,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        headlineMedium: GoogleFonts.anekBangla(
          textStyle: const TextStyle(
            fontSize: 20,
            letterSpacing: 3,
            color: MyColors.myWhite,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        bodyLarge: GoogleFonts.anekBangla(
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        bodyMedium: GoogleFonts.anekBangla(
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 1.5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.myDark,
        iconTheme: const IconThemeData(color: MyColors.myWhite, size: 32),
        titleTextStyle: GoogleFonts.anekBangla(
          color: MyColors.myWhite,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
        actionsIconTheme: const IconThemeData(
          size: 25,
        ),
      ),
      iconTheme: const IconThemeData(
        color: MyColors.myWhite,
      ),
    );
  }
}
