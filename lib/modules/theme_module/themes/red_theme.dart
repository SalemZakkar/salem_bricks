import 'package:flutter/material.dart';

ThemeData red = ThemeData(
    primaryColor: const Color(0xFF330000),
    scaffoldBackgroundColor: const Color(0xFF330000),
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.white, fontSize: 20),
      bodyText1: TextStyle(color: Colors.white),
    ),
    dividerColor: const Color(0xFFBBA666),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: const MaterialStatePropertyAll(
              Color(0xFFBBA666),
            ),
            textStyle: const MaterialStatePropertyAll(
                TextStyle(fontSize: 20, color: Colors.black)),
            alignment: Alignment.center,
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))))));
