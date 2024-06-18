import 'package:flutter/material.dart';

class LightTheme {
  ThemeData theme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      error: Colors.red,
      onError: Colors.red,
      onPrimaryContainer: Colors.white,
      onPrimaryFixed: Color(0xffd9d9d9),
      secondary: Color(0xffbebebe),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xfff0f0f0),
    ),
    cardColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xfff0f0f0),
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: 'Poppins',
    dialogBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
      displayLarge: TextStyle(
        fontSize: 20,
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        color: Color(0xff6e6e6e)
      ),
      displaySmall: TextStyle(
        fontSize: 14,
        color: Color(0xff6e6e6e)
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
      ),
      bodySmall: TextStyle(
        fontSize: 14
      ),
    ),
  );
}

class DarkTheme {
  ThemeData theme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      error: Colors.red,
      onError: Colors.red,
      onPrimaryContainer: Color(0xff202020),
      onPrimaryFixed: Color(0xff222222),
      secondary: Color(0xff9e9e9e)
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff121212)
    ),
    scaffoldBackgroundColor: const Color(0xff121212),
    cardColor: const Color(0xff202020),
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
      displayLarge: TextStyle(
        fontSize: 20,
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        color: Color(0xff9e9e9e)
      ),
      displaySmall: TextStyle(
        fontSize: 14,
        color: Color(0xff9e9e9e)
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
      ),
      bodySmall: TextStyle(
        fontSize: 14
      ),
    ),
  );
}
