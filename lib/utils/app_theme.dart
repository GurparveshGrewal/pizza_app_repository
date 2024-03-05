import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 90, 72, 130),
    brightness: Brightness.dark);

class AppThemeData {
  ThemeData darkThemeData = ThemeData.dark().copyWith();
  ThemeData themeData = ThemeData().copyWith(
    colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kColorScheme.onPrimaryContainer,
      foregroundColor: kColorScheme.primaryContainer,
    ),
    textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: kColorScheme.onSecondaryContainer,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
          bodyLarge: TextStyle(
            color: kColorScheme.onSecondary,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
    cardTheme: const CardTheme().copyWith(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: kColorScheme.secondaryContainer,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.primary,
      foregroundColor: kColorScheme.secondaryContainer,
    )),
  );
}
