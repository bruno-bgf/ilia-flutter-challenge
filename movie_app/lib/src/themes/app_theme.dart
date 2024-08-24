import 'package:flutter/material.dart';
import 'package:movie_app/src/themes/movie_hub_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: MovieHubColors.primaryPurple,
    scaffoldBackgroundColor: MovieHubColors.cultured,
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: MovieHubColors.primaryPurple,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}
