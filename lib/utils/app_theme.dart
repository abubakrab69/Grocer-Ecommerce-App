import 'package:flutter/material.dart';

class AppTheme {
  //light mode
  static final light = ThemeData(
    primaryColor: const Color.fromARGB(255, 119, 171, 59),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 119, 171, 59),
      brightness: Brightness.light,
      primary: const Color.fromARGB(255, 119, 171, 59),
      surface: Colors.white,
    ),
    cardColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: const Color.fromARGB(255, 119, 171, 59),
      unselectedItemColor: Colors.grey,
    ),
  );

  // dark mode
  static final dark = ThemeData(
    primaryColor: const Color.fromARGB(255, 119, 171, 59),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 119, 171, 59),
      brightness: Brightness.dark,
      primary: const Color.fromARGB(255, 119, 171, 59),
      surface: Colors.black,
    ),
    cardColor: Colors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color.fromARGB(255, 47, 46, 46),
      selectedItemColor: const Color.fromARGB(255, 119, 171, 59),
      unselectedItemColor: Colors.grey,
    ),
  );
}
