import 'package:flutter/material.dart';

const _primaryColor = Color(0xFFF82B10);

const _textTheme = TextTheme(
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
  primaryColor: _primaryColor,
  textTheme: _textTheme,
  scaffoldBackgroundColor: Color.fromARGB(255, 46, 41, 41),
  colorScheme: ColorScheme.fromSeed(
    seedColor: _primaryColor,
    brightness: Brightness.dark,
  ),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: _primaryColor,
  textTheme: _textTheme,
  scaffoldBackgroundColor: const Color(0xFFEFF1F3),
  colorScheme: ColorScheme.fromSeed(
    seedColor: _primaryColor,
    brightness: Brightness.light,
  ),
);
