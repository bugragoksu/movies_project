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
        cardTheme: _buildCardTheme,
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

  CardTheme get _buildCardTheme {
    return CardTheme(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.black.withOpacity(0.5),
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
