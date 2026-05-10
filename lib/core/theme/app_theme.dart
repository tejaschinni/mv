import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFB70011);
  static const Color onPrimary = Colors.white;
  static const Color primaryContainer = Color(0xFFDC2626);
  static const Color onPrimaryContainer = Color(0xFFFFF6F5);
  static const Color surface = Color(0xFFF8F9FF);
  static const Color onSurface = Color(0xFF121C28);
  static const Color outlineVariant = Color(0xFFE6BDB8);
  static const Color onSurfaceVariant = Color(0xFF5C403C);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      surface: surface,
      onSurface: onSurface,
      outlineVariant: outlineVariant,
    ),
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.01,
      ),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
  );
}
