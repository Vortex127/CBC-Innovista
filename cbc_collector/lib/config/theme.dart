import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    const primary = Color(0xFF2E7D32); // Green 800
    const secondary = Color(0xFF00796B); // Teal 700

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
        tertiary: const Color(0xFFF57C00), // Orange 700
        background: Colors.grey[50]!,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.grey[50],
        foregroundColor: primary,
        centerTitle: true,
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: primary,
          foregroundColor: Colors.white,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          foregroundColor: primary,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey[600],
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: Colors.grey[900],
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: Colors.grey[900],
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: Colors.grey[900],
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: Colors.grey[900],
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: Colors.grey[900],
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: Colors.grey[900],
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: Colors.grey[800],
        ),
        bodyMedium: TextStyle(
          color: Colors.grey[800],
        ),
        bodySmall: TextStyle(
          color: Colors.grey[700],
        ),
      ),
    );
  }
} 