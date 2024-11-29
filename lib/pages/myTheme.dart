import 'package:flutter/material.dart';

const Color primaryColor = Colors.red;
const FontWeight bold = FontWeight.bold;

ThemeData myTheme = ThemeData(
  appBarTheme: _buildAppBarTheme(),
  buttonTheme: _buildButtonTheme(),
  textTheme: _buildTextTheme(),
  inputDecorationTheme: _buildInputDecorationTheme(),
  elevatedButtonTheme: _buildElevatedButtonTheme(),
);

AppBarTheme _buildAppBarTheme() {
  return const AppBarTheme(
    backgroundColor: primaryColor,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: bold,
      color: Colors.white,
      shadows: [
        Shadow(
          blurRadius: 7.0,
          color: Colors.black,
          offset: Offset(0, 2),
        ),
      ],
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

InputDecorationTheme _buildInputDecorationTheme() {
  return const InputDecorationTheme(
    fillColor: Colors.white70,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      borderSide: BorderSide(color: Colors.red, width: 2.0),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  );
}

class MyTheme {
  static InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      fillColor: Colors.white70, // Cor de fundo do campo de texto
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)), // Bordas arredondadas
        borderSide: BorderSide(color: Colors.red, width: 2.0), // Definindo a cor da borda como vermelha
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: Colors.red, width: 2.0), // Borda quando habilitado
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: Colors.red, width: 2.0), // Borda quando focado
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    );
  }

  static InputDecoration dateInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      fillColor: Colors.white70, // Cor de fundo do campo de texto
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)), // Bordas arredondadas
        borderSide: BorderSide(color: Colors.red, width: 2.0), // Definindo a cor da borda como vermelha
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: Colors.red, width: 2.0), // Borda quando habilitado
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: Colors.red, width: 2.0), // Borda quando focado
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Padding interno
    );
  }
}
ElevatedButtonThemeData _buildElevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(20.0),
      textStyle: TextStyle(
        color: Colors.white,
          fontWeight: FontWeight.bold,
        fontSize: 14,
      )
    ),
  );
}
