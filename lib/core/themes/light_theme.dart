import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';

ThemeData lightMode() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey.shade300,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: kPrimaryColor, width: 2),
      ),
    ),
    iconTheme: IconThemeData(color: Colors.black),
  );
}
