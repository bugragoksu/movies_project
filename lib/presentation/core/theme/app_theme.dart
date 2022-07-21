import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final AppTheme _instance = AppTheme._();

  static AppTheme get instance => _instance;

  ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.lightGreen.shade900,
        ),
        inputDecorationTheme: _buildInputDecorationTheme,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.grey.shade900,
          selectionColor: Colors.blueAccent.shade400,
        ),
      );

  InputDecorationTheme get _buildInputDecorationTheme {
    final kInputBorderRadius = BorderRadius.circular(8);
    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade300,
      border: OutlineInputBorder(
        borderRadius: kInputBorderRadius,
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: kInputBorderRadius,
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: kInputBorderRadius,
        borderSide: BorderSide(
          color: Colors.grey.shade900,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: kInputBorderRadius,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: kInputBorderRadius,
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
