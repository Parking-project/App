import 'package:flutter/material.dart';

const _primaryColor = Color.fromARGB(255, 255, 90, 90);

const _textTheme = TextTheme(
  titleSmall: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  titleMedium: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
  ),
  titleLarge: TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w600,
  ),

  displaySmall: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: _primaryColor
  )
);

const _buttonTheme = ButtonThemeData(

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
