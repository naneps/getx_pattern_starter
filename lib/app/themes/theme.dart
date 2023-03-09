import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp {
  static Color primaryColor = Color(0xFF4f46e5);
  static Color secondaryColor = Color(0xFFffedd5);
  static Color accentColor = const Color(0xFF7dd3fc);
  static Color neutralColor = Color(0xFF362037);
  static Color infoColor = const Color(0xFFc7d2fe);
  static Color errorColor = const Color(0xFFF43E56);
  static Color warningColor = const Color(0xFFF6B02C);
  static Color successColor = const Color(0xFF0D7766);
  static Color backgroundColor = Color(0xFFf5f5f4);
  // static Color secondaryColor = Color.fromRGBO(16, 85, 81, 1);
  static Color darkColor = const Color.fromARGB(255, 54, 54, 54);
  static Color dangerColor = const Color.fromARGB(255, 255, 91, 91);
  static Color grayColor = const Color.fromARGB(255, 239, 239, 255);
  static Color lightColor = const Color.fromARGB(255, 240, 240, 240);
  static Color grayTextColor = const Color.fromARGB(255, 168, 168, 168);
  static Color primaryTextColor = Color.fromARGB(255, 50, 50, 50);
  static Color secondaryTextColor = const Color.fromARGB(255, 112, 136, 254);
  static Color darkTextColor = const Color.fromARGB(255, 55, 55, 55);
  static Color lightTextColor = const Color.fromARGB(255, 240, 240, 240);
  static Color accentTextColor = const Color.fromARGB(255, 255, 237, 149);
  static Color errorTextColor = const Color.fromARGB(255, 255, 149, 149);
  static Color successTextColor = const Color.fromARGB(255, 149, 255, 161);
  static Color warningTextColor = const Color.fromARGB(255, 255, 220, 149);

  static ThemeData defaultTheme = ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: neutralColor,
    primaryColorLight: backgroundColor,
    errorColor: errorColor,
    backgroundColor: lightColor,
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: primaryTextColor,
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      headline2: TextStyle(
        color: primaryTextColor,
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      headline3: TextStyle(
        color: primaryTextColor,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        color: primaryTextColor,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        color: primaryTextColor,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      headline6: TextStyle(
        color: primaryTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      subtitle1: TextStyle(
        color: primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      ),
      subtitle2: TextStyle(
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyText1: TextStyle(
        color: primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyText2: TextStyle(
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      button: TextStyle(
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
      caption: TextStyle(
        color: primaryTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      overline: TextStyle(
        color: primaryTextColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: grayColor,
        ),
      ),
      hintStyle: TextStyle(
        color: grayTextColor,
        fontSize: 14,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: grayColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: darkColor.withOpacity(0.5),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: errorColor,
        ),
      ),
      labelStyle: TextStyle(
        color: darkColor,
        fontSize: 14,
      ),
      errorStyle: TextStyle(
        color: errorColor,
      ),
      suffixIconColor: primaryColor,
      suffixStyle: TextStyle(
        color: primaryColor,
      ),
      prefixIconColor: primaryColor,
      prefixStyle: TextStyle(
        color: primaryColor,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: lightTextColor,
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      color: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: lightTextColor,
      ),
      toolbarTextStyle: TextTheme(
        headline6: TextStyle(
          color: lightTextColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
      ).bodyText2,
      titleTextStyle: TextTheme(
        headline6: TextStyle(
          color: lightTextColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
      ).headline6,
    ),
  );
}
