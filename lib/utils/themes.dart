import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      canvasColor: const Color.fromRGBO(54, 2, 176, 1),
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      primaryColor: const Color.fromRGBO(51, 51, 51, 1),
      cardColor: const Color.fromRGBO(255, 255, 255, 1),
      highlightColor: const Color.fromRGBO(56, 14, 157, 1),
      focusColor: const Color.fromRGBO(54, 2, 176, 1),
      shadowColor: const Color.fromRGBO(112, 112, 112, 1),
      dividerColor: const Color.fromRGBO(224, 224, 224, 1),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Color.fromRGBO(55, 0, 179, 1)),
      ),
      hoverColor: const Color.fromRGBO(54, 2, 176, 1),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
        color: Colors.black,
      )),
      buttonColor: const Color.fromRGBO(55, 0, 179, 1));

  static final dark = ThemeData.dark().copyWith(
      hoverColor: const Color.fromRGBO(187, 134, 252, 1),
      canvasColor: const Color.fromRGBO(117, 6, 250, 1),
      backgroundColor: const Color.fromRGBO(24, 22, 33, 1),
      primaryColor: Colors.white,
      cardColor: const Color.fromRGBO(45, 43, 53, 1),
      highlightColor: const Color.fromRGBO(249, 249, 249, 1),
      focusColor: const Color.fromRGBO(22, 201, 163, 1),
      shadowColor: const Color.fromRGBO(163, 162, 173, 1),
      dividerColor: const Color.fromRGBO(224, 224, 224, 1),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Color.fromRGBO(187, 134, 252, 1)),
      ),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
        color: Colors.white,
      )),
      buttonColor: const Color.fromRGBO(100, 0, 215, 1));
}

// import 'package:flutter/material.dart';

// class Themes {
//   static final light = ThemeData.light().copyWith(
//     canvasColor: const Color.fromRGBO(54, 2, 176, 1),
//     backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
//     primaryColor: const Color.fromRGBO(51, 51, 51, 1),
//     cardColor: const Color.fromRGBO(255, 255, 255, 1),
//     highlightColor: const Color.fromRGBO(56, 14, 157, 1),
//     focusColor: const Color.fromRGBO(54, 2, 176, 1),
//     shadowColor: const Color.fromRGBO(112, 112, 112, 1),
//     hoverColor: const Color.fromRGBO(54, 2, 176, 1),
//   );

//   static final dark = ThemeData.dark().copyWith(
//     canvasColor: const Color.fromRGBO(117, 6, 250, 1),
//     backgroundColor: const Color.fromRGBO(24, 22, 33, 1),
//     primaryColor: Colors.white,
//     cardColor: const Color.fromRGBO(45, 43, 53, 1),
//     highlightColor: const Color.fromRGBO(249, 249, 249, 1),
//     focusColor: const Color.fromRGBO(22, 201, 163, 1),
//     shadowColor: const Color.fromRGBO(163, 162, 173, 1),
//     hoverColor: const Color.fromRGBO(187, 134, 252, 1),
//   );
// }
