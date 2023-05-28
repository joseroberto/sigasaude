import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0,80,159, 1)),
  brightness: Brightness.light,
  primaryColor: const Color.fromRGBO(0,80,159, 1),

  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Color.fromRGBO(44, 62, 80, 1)
    ),
    titleMedium: TextStyle(
      color: Color.fromRGBO(177, 177, 177, 1)
    ),
    labelSmall: TextStyle(
      color: Color.fromRGBO(231, 239, 246, 1)
    ),
    labelLarge: TextStyle(
      color: Color.fromRGBO(172, 172, 172, 1)
    )
  )
);