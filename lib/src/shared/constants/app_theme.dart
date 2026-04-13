import 'package:flutter/material.dart';

import '../../../assets/colors.gen.dart';
import '../../../assets/fonts.gen.dart';

class AppTheme {
  static TextTheme lightTextTheme = const TextTheme(
    headlineMedium: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    displayLarge: TextStyle(
      fontSize: 32.0,
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 21.0,
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 16.0,
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 14.0,
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 12.0,
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    headlineMedium: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    displayLarge: TextStyle(
      fontSize: 32.0,
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 21.0,
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 16.0,
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 14.0,
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 12.0,
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      useMaterial3: false,
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorName.lightBlueGrey,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        foregroundColor: ColorName.black,
        backgroundColor: Colors.white,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: ColorName.primary,
        unselectedLabelColor: ColorName.lightGrey,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: ColorName.primary,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: ColorName.primary,
      ),
      textTheme: lightTextTheme,
    );
  }
}
