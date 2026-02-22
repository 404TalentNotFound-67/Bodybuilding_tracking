import 'package:flutter/material.dart';

/// 🔹 LIGHT MODE
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF1E88E5), // Fitness Blue
    secondary: const Color(0xFF26A69A), // Teal Accent
    surface: Colors.grey.shade300,
    onPrimary: Colors.white,
    onSurface: Colors.black,
    surfaceContainer: Colors.grey.shade200,
  ),
  scaffoldBackgroundColor: const Color(0xFFF5F7FA),
  appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Colors.grey.shade300, foregroundColor: Colors.black),
);

/// 🔹 DARK MODE
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFF1565C0),
    secondary: const Color(0xFF26A69A),
    surface: const Color(0xFF121212),
    onPrimary: Colors.white,
    onSurface: Colors.white,
    surfaceContainer: const Color(0xFF1E1E1E),
  ),
  scaffoldBackgroundColor: const Color(0xFF1E1E1E),

  appBarTheme: const AppBarTheme(elevation: 0, backgroundColor: Color(0xFF121212), foregroundColor: Colors.white),
);
