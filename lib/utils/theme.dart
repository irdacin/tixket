import 'package:flutter/material.dart';

class LightTheme {
  ThemeData theme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      error: Colors.red,
      onError: Colors.red,
      background: Color(0xfff0f0f0),
      onBackground: Color(0xffd9d9d9),
      onPrimaryContainer: Colors.white,
      secondary: Color(0xffbebebe),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xfff0f0f0),
    ),
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
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
      bodyLarge: TextStyle(
        fontSize: 20
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
      background: Color(0xff121212),
      onBackground: Color(0xff222222),
      error: Colors.red,
      onError: Colors.red,
      onPrimaryContainer: Color(0xff202020),
      secondary: Color(0xff6e6e6e)
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff121212)
    ),
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
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
      bodyLarge: TextStyle(
        fontSize: 20
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
