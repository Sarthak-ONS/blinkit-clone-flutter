import 'package:ecom/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTHeme = ThemeData(
    primaryColor: AppColors.primaryYellowColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    fontFamily: 'Catamaran',
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: 17,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 2,
    ),
  );
}
