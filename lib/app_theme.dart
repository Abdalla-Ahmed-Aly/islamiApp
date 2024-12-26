import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xffE2BE7F);
  static const Color black = Color(0xff202020);
  static const Color white = Color(0xFFFFFFFF);

 static ThemeData lightTheme = ThemeData(

 );
 static ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: black,
    foregroundColor: primary,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: primary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    )
  ),
  scaffoldBackgroundColor: black,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: primary,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    selectedItemColor: white,
  ),
  textTheme: TextTheme(
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: white,
    ),
    titleLarge: TextStyle(
       fontSize: 20,
      fontWeight: FontWeight.bold,
      color: white,
    ),
    titleMedium: TextStyle(
       fontSize: 16,
      fontWeight: FontWeight.bold,
      color: white,
    ),
    titleSmall: TextStyle(
       fontSize: 14,
      fontWeight: FontWeight.bold,
      color: white,
    ),
  ),
 );
}