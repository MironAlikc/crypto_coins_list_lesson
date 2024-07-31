import 'package:flutter/material.dart';

final darkTeme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  primarySwatch: Colors.yellow,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color.fromARGB(255, 31, 31, 31),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
  dividerColor: Colors.white24,
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
  ),
  // useMaterial3: true,
);
