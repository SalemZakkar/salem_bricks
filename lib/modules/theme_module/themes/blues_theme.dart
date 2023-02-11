import 'package:flutter/material.dart';

ThemeData blue = ThemeData(
    primaryColor: const Color(0xFF0A1435),
    scaffoldBackgroundColor: const Color(0xFF0A1435),
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.white, fontSize: 20),
      bodyText1: TextStyle(color: Colors.white),
    ),
    dividerColor: Colors.deepOrange,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: const MaterialStatePropertyAll(
              Colors.deepOrange,
            ),
            textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 20)),
            alignment: Alignment.center,
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))))));
