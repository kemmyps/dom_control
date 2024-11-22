import 'package:flutter/material.dart';

const Color primaryColor = Colors.red;
const FontWeight bold = FontWeight.bold;

ThemeData myTheme = ThemeData(
  appBarTheme: _buildAppBarTheme(),
  buttonTheme: _buildButtonTheme(),
  textTheme: _buildTextTheme(),
);

AppBarTheme _buildAppBarTheme() {
  return const AppBarTheme(
    backgroundColor: primaryColor,
    titleTextStyle: TextStyle(
      fontSize: 40,
      fontWeight: bold,
      color: Colors.white,
    ),
  );
}

ButtonThemeData _buildButtonTheme() {
  return const ButtonThemeData(
    buttonColor: primaryColor,
    textTheme: ButtonTextTheme.primary,
  );
}

TextTheme _buildTextTheme() {
  return const TextTheme(
    displayLarge: TextStyle(fontSize: 96.0, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 16.0),
    bodyMedium: TextStyle(fontSize: 14.0),
    bodySmall: TextStyle(fontSize: 12.0),
    labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(fontSize: 10.0),
  );
}