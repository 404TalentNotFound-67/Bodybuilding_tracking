import 'package:flutter/material.dart';

/// 🔹 LIGHT MODE
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF1E88E5), // Fitness Blue
    secondary: const Color(0xFF26A69A), // Teal Accent
    surface: Colors.white,
    //background: const Color(0xFFF5F7FA),
    onPrimary: Colors.white,
    onSurface: Colors.black,
  ),
  scaffoldBackgroundColor: const Color(0xFFF5F7FA),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xFF1E88E5),
    foregroundColor: Colors.white,
  ),
);

/// 🔹 DARK MODE
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFF1565C0),
    secondary: const Color(0xFF26A69A),
    surface: const Color(0xFF121212),
    //background: const Color(0xFF1E1E1E),
    onPrimary: Colors.white,
    onSurface: Colors.white,
  ),
  scaffoldBackgroundColor: const Color(0xFF1E1E1E),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xFF1565C0),
    foregroundColor: Colors.white,
  ),
);
