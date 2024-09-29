import 'package:flutter/material.dart';

final  theme = ThemeData(
  primaryColor: const Color(0xfffcfcff),
  // accentColor: Colors.orange,
  scaffoldBackgroundColor: const Color(0xfffcfcff),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    // textTheme: TextTheme(
    //   headline6: TextStyle(
    //     color: Colors.black,
    //     fontSize: 18.0,
    //     fontWeight: FontWeight.w800,
    //   ),
    // ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.orangeAccent,
  ),);