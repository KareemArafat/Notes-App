import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';

ThemeData darkMode() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey.shade800,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: kPrimaryColor, width: 2),
      ),
    ),
    iconTheme: IconThemeData(color: Colors.white),
    
  );
}
