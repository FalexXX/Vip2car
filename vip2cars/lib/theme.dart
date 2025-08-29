import 'package:flutter/material.dart';

class AppTheme {
  // Paleta inspirada en el fondo crema del Figma
  static const _black = Color.fromARGB(255, 0, 0, 0);
  static const _ink = Color(0xFF1F1F1F);
  static const _dangerous = Color.fromRGBO(228, 2, 46, 1); // acento sobrio
  static const _secondary = Color(0xFF8E8E93);

  static const schemeLight = ColorScheme(
    brightness: Brightness.light,
    primary: _dangerous,
    onPrimary: Colors.white,
    secondary: _secondary,
    onSecondary: Colors.white,
    error: Color(0xFFB00020),
    onError: Colors.white,
    background: _black,
    onBackground: _ink,
    surface: Colors.white,
    onSurface: _ink,
  );

  static final inputTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.black.withOpacity(0.08)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.black.withOpacity(0.08)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color.fromRGBO(228, 2, 46, 1), width: 1.4),
    ),
  );

  static const appBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    foregroundColor: _ink,
  );

  static final buttonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _dangerous,
      foregroundColor: Colors.white,
      minimumSize: const Size.fromHeight(52),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 0,
    ),
  );
}
