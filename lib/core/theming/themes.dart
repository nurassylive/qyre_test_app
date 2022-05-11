import 'package:flutter/material.dart';

ThemeData themes = ThemeData(
  appBarTheme: const AppBarTheme(foregroundColor: Colors.white),
  primaryColor: Colors.white,
  backgroundColor: const Color(0xff111111),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedItemColor: Colors.white,
    unselectedIconTheme: IconThemeData(size: 18),
    selectedItemColor: Colors.white,
    selectedIconTheme: IconThemeData(size: 22),
    elevation: 0,
    showUnselectedLabels: false,
    showSelectedLabels: false,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontSize: 16),
    button: TextStyle(
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
    ),
    headline1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Color(0xff444444),
    ),
    subtitle1: TextStyle(
      color: Color(0xffc9c9c9),
    ),
  ),
  buttonTheme: const ButtonThemeData(),
  // primarySwatch: const MaterialColor(
  //   0xFF526E2D,
  //   <int, Color>{
  //     50: Color(0x00526E2D),
  //     100: Color(0x1A526E2D),
  //     200: Color(0x33526E2D),
  //     300: Color(0x66526E2D),
  //     400: Color(0x80526E2D),
  //     500: Color(0x99526E2D),
  //     600: Color(0xB3526E2D),
  //     700: Color(0xCC526E2D),
  //     800: Color(0xE6526E2D),
  //     900: Color(0xFF526E2D),
  //   },
  // ),
);
