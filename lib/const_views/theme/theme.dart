import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),
  ),
  brightness: Brightness.light,

  textTheme: TextTheme(
    headlineLarge: TextStyle(color: Colors.black, fontFamily: 'Inter'),
  ),
  scaffoldBackgroundColor: Colors.white,
  iconTheme: IconThemeData(color: Colors.white),

  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xff014A3D),
    titleTextStyle: TextStyle(fontFamily: 'Roboto', fontSize: 20),
    elevation: 0,
    surfaceTintColor: Color(0xff014A3D),
  ),
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade100,

    onPrimary: const Color.fromARGB(255, 2, 75, 4),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade800,
    onPrimary: const Color.fromARGB(255, 2, 60, 3),
  ),
);
