import 'package:covid_19_tracker/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.appThemeColor,
      textTheme: _textTheme(),
      appBarTheme: _appBarTheme(),
      elevatedButtonTheme: _elevatedButtonThemeData(),
      inputDecorationTheme: _inputDecorationTheme(),
      textButtonTheme: _textButtonThemeData(),
      listTileTheme: _listTileThemeData(),
    );
  }

  static ThemeData darkThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.appThemeColor,
      textTheme: _textTheme(),
      appBarTheme: _appBarTheme(),
      elevatedButtonTheme: _elevatedButtonThemeData(),
      inputDecorationTheme: _inputDecorationTheme(),
      textButtonTheme: _textButtonThemeData(),
      listTileTheme: _listTileThemeData(),
    );
  }

  static TextTheme _textTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    );
  }

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.appThemeColor,
      foregroundColor: Colors.white,
    );
  }

  static ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        fixedSize: const Size(double.maxFinite, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      border: _buildOutlineInputBorder(),
      focusedBorder: _buildOutlineInputBorder(),
      errorBorder: _buildOutlineInputBorder(Colors.red),
      enabledBorder: _buildOutlineInputBorder(),
      hintStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade700,
      ),
      prefixIconColor: Colors.grey.shade700,
    );
  }

  static TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    );
  }

  static ListTileThemeData _listTileThemeData() {
    return const ListTileThemeData(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      subtitleTextStyle: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static OutlineInputBorder _buildOutlineInputBorder(
      [Color color = Colors.grey]) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: color),
      borderRadius: BorderRadius.circular(50.00),
    );
  }
}
