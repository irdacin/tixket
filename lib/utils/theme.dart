import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
    error: Colors.red,
    onError: Colors.red,
    background: Color(0xffdcdcde),
    onBackground: Color(0xffd9d9d9)
  ),
  useMaterial3: true,
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      color: Color(0xff858484)
    ),
    headlineLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),
    bodyMedium: TextStyle(
      fontSize: 16
    )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.red
  )
);

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    background: Color(0xff121212),
    onBackground: Color(0xff262626),
    error: Colors.red,
    onError: Colors.red,
  ),
  useMaterial3: true,
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      color: Color(0xff858484)
    ),
    headlineLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),
    bodyMedium: TextStyle(
      fontSize: 16
    )
  ),
);