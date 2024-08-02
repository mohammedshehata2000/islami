import 'package:flutter/material.dart';
import 'package:islamii/app_colors.dart';

class MyThemeData {
  static final ThemeData lightMode = ThemeData(
      primaryColor: AppColors.primaryLightColor,
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: AppColors.whiteColor),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.blackColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: AppColors.blackColor,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          color: AppColors.blackColor,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.blackColor));
  static final ThemeData darkMode = ThemeData(
      primaryColor: AppColors.primaryDarkColor,
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: AppColors.primaryDarkColor),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.yellowColor)),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.yellowColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: AppColors.yellowColor,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          color: AppColors.yellowColor,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.yellowColor));
}
