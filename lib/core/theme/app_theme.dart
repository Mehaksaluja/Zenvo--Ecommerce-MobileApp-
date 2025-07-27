import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Private constructor to prevent instantiation.
  AppTheme._();

  // Define core colors for easy access and consistency.
  static const Color _primaryColor = Color(0xFF2A3F54);
  static const Color _secondaryColor = Color(0xFF1ABB9C);
  static const Color _lightBackgroundColor = Color(0xFFF7F7F7);
  static const Color _darkBackgroundColor = Color(0xFF121212);
  static const Color _lightSurfaceColor = Colors.white;
  static const Color _darkSurfaceColor = Color(0xFF1E1E1E);
  static const Color _errorColor = Color(0xFFE74C3C);

  // --- LIGHT THEME ---
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: _primaryColor,
    scaffoldBackgroundColor: _lightBackgroundColor,

    // Define the color scheme for the light theme.
    colorScheme: const ColorScheme.light(
      primary: _primaryColor,
      secondary: _secondaryColor,
      background: _lightBackgroundColor,
      surface: _lightSurfaceColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Color(0xFF333333),
      onSurface: Color(0xFF333333),
      error: _errorColor,
      onError: Colors.white,
    ),

    // Define the text theme using Google Fonts for a modern look.
    textTheme: _textTheme(baseColor: const Color(0xFF333333)),

    // Define the AppBar theme.
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryColor,
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),

    // Define the FilledButton theme for primary actions.
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: _secondaryColor, // Use accent color for CTAs
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),

    // Define the OutlinedButton theme for secondary actions.
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _primaryColor,
        side: const BorderSide(color: _primaryColor, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        textStyle: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),

    // Define the input decoration theme for text fields.
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _lightSurfaceColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: _primaryColor, width: 2),
      ),
      labelStyle: const TextStyle(color: Colors.grey),
    ),

    // Define the Card theme.
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: _lightSurfaceColor,
      surfaceTintColor: Colors.transparent,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),

    // Define the Icon theme.
    iconTheme: const IconThemeData(color: _primaryColor, size: 24.0),
  );

  // --- DARK THEME ---
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: _secondaryColor, // Use accent color as primary in dark mode
    scaffoldBackgroundColor: _darkBackgroundColor,

    // Define the color scheme for the dark theme.
    colorScheme: const ColorScheme.dark(
      primary: _secondaryColor,
      secondary: _primaryColor,
      background: _darkBackgroundColor,
      surface: _darkSurfaceColor,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onBackground: Colors.white70,
      onSurface: Colors.white,
      error: _errorColor,
      onError: Colors.black,
    ),

    // Define the text theme for dark mode.
    textTheme: _textTheme(baseColor: Colors.white),

    // Define the AppBar theme for dark mode.
    appBarTheme: const AppBarTheme(
      backgroundColor: _darkSurfaceColor,
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),

    // Define the FilledButton theme for dark mode.
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: Colors.black, // High contrast text
        backgroundColor: _secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),

    // Define the OutlinedButton theme for dark mode.
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _secondaryColor,
        side: const BorderSide(color: _secondaryColor, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        textStyle: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),

    // Define the input decoration theme for dark mode.
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _darkSurfaceColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade700, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: _secondaryColor, width: 2),
      ),
      labelStyle: TextStyle(color: Colors.grey.shade400),
    ),

    // Define the Card theme for dark mode.
    cardTheme: CardThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: _darkSurfaceColor,
      surfaceTintColor: Colors.transparent,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),

    // Define the Icon theme for dark mode.
    iconTheme: const IconThemeData(color: Colors.white70, size: 24.0),
  );

  // Helper function to create a consistent text theme.
  static TextTheme _textTheme({required Color baseColor}) {
    return TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 57,
        fontWeight: FontWeight.bold,
        color: baseColor,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: baseColor,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: baseColor,
      ),

      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),

      titleLarge: GoogleFonts.lato(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: baseColor,
      ),
      titleMedium: GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: baseColor,
      ),
      titleSmall: GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: baseColor,
      ),

      bodyLarge: GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: baseColor,
      ),
      bodyMedium: GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: baseColor,
      ),
      bodySmall: GoogleFonts.lato(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: baseColor,
      ),

      labelLarge: GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: baseColor,
      ),
      labelMedium: GoogleFonts.lato(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: baseColor,
      ),
      labelSmall: GoogleFonts.lato(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: baseColor,
      ),
    ).apply(bodyColor: baseColor, displayColor: baseColor);
  }
}
