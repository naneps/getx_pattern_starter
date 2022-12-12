import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp {
  static const Color primaryColor = Color(0xFF0D47A1);
  static const Color secondaryColor = Color.fromARGB(255, 71, 163, 255);
  static const Color accentColor = Color(0xFFE65100);
  static const Color errorColor = Color(0xFFB00020);
  static const Color infoColor = Color(0xFF1976D2);
  static const Color blackColor = Color.fromARGB(255, 25, 25, 25);
  static const Color successColor = Color(0xFF388E3C);
  static const Color warningColor = Color(0xFFFFA000);
  static const Color backgroundColor = Color.fromARGB(255, 236, 236, 236);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color onPrimaryColor = Color(0xFFFFFFFF);

  static ThemeData get themeData => ThemeData(
        primaryColor: primaryColor,
        primaryColorDark: primaryColor,
        primaryColorLight: primaryColor,
        secondaryHeaderColor: secondaryColor,
        errorColor: errorColor,
        backgroundColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        canvasColor: backgroundColor,
        cardColor: surfaceColor,
        indicatorColor: primaryColor,
        toggleableActiveColor: primaryColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 96,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
          ),
          headline2: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
          ),
          headline3: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w400,
          ),
          headline4: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          headline5: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          button: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
          ),
          caption: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
          overline: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
      );
}
