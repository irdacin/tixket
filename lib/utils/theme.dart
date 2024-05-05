import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
    error: Colors.red,
    onError: Colors.red,
    background: Color(0xfff0f0f0),
    onBackground: Color(0xffd9d9d9),
    onPrimaryContainer: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xfff0f0f0),
  ),
  useMaterial3: true,
  fontFamily: 'Poppins',
  textTheme: TextTheme(
    labelMedium: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      color: Colors.grey[600]
    ),
    headlineLarge: const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold
    ),
    headlineMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600
    ),
    headlineSmall: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),
    bodyMedium: const TextStyle(
      fontSize: 16
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    background: Color(0xff121212),
    onBackground: Color(0xff242424),
    error: Colors.red,
    onError: Colors.red,
    onPrimaryContainer: Colors.black
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff121212)
  ),
  useMaterial3: true,
  fontFamily: 'Poppins',
  textTheme: TextTheme(
    labelMedium: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      color: Colors.grey[600]
    ),
    headlineLarge: const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold
    ),
    headlineMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600
    ),
    headlineSmall: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),
    bodyMedium: const TextStyle(
      fontSize: 16
    )
  ),
);