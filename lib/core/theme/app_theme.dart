import 'package:flutter/material.dart';

class AppTheme {
  // Warm color palette
  static const Color primaryColor = Color(0xFFFF8C00); // Warm Orange
  static const Color accentColor = Color(0xFF5D4037); // Elegant Dark Brown
  static const Color backgroundColor = Color(0xFFF9F6F1); // Off-white/Cream
  static const Color cardColor = Colors.white;
  static const Color surfaceColor = Color(0xFFFFF8E1); // Soft Amber
  static const Color secondaryColor = Color(0xFFD7CCC8); // Beige

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: accentColor,
        surface: cardColor,
        error: Colors.redAccent,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
      ),
      // FIX: Changed CardTheme to CardThemeData to match updated Flutter SDK requirements
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadowColor: Colors.black12,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 54),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: accentColor, fontWeight: FontWeight.bold, fontSize: 32),
        headlineMedium: TextStyle(color: accentColor, fontWeight: FontWeight.bold, fontSize: 24),
        titleLarge: TextStyle(color: accentColor, fontWeight: FontWeight.w600, fontSize: 18),
        bodyLarge: TextStyle(color: accentColor, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
      ),
    );
  }
}
