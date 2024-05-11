import 'package:flutter/material.dart';

const primaryColor = Color(0xFFF82B10);

const textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  titleLarge: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: primaryColor,
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
  ),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: primaryColor,
  textTheme: textTheme,
  scaffoldBackgroundColor: const Color(0xFFEFF1F3),
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
  ),
);
