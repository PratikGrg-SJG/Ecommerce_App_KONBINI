import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xff58b268);
Color baseColor = const Color(0xff2D2E4A);
Color secondaryColor1 = const Color(0xff6428D9);
Color secondaryColor2 = const Color(0xffFEBD01);
Color secondaryColor3 = const Color(0xffF6F6F6);
Color secondaryColor4 = const Color(0xffA7A6B6);

ThemeData appTheme = ThemeData(
  fontFamily: GoogleFonts.nunitoSans().fontFamily,
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: baseColor,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),

    //for main heading
    bodyLarge: TextStyle(
      color: baseColor,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),

//for body heading or title
    bodyMedium: TextStyle(
      color: baseColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),

    //for small text
    bodySmall: TextStyle(
      color: baseColor,
      fontSize: 13,
      fontWeight: FontWeight.bold,
    ),

    //for product pricing

    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: baseColor,
    ),

    //for product label
    labelSmall: const TextStyle(
      color: Colors.grey,
      fontSize: 12,
    ),

    //for product title
    labelMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: baseColor,
    ),
  ),
);
