import 'package:flutter/material.dart';

class AppColors {
  // ignore: prefer_const_declarations
  static const Color primaryDark = Color.fromARGB(255, 0, 85, 124);
  static const Color primaryLight = Color.fromARGB(255, 4, 124, 180);
  static const Color primaryColor = Color(0xffEF6F19);
  static const Color primaryButtonColor = Color(0xffFF9757);
  static const Color black = Colors.black;
  static const Color fieldColor = Color(0xffF7B287);
  static const Color background = Color.fromARGB(255, 255, 255, 255);
  static const Color transparent = Colors.transparent;
  static const Color orange = Color(0xffFF8616);
  static const Color grey = Color(0xff757575);
  static const Color white = Colors.white;
  static const Color primarytext = Color(0xffE9460F);
  static const Color homeScreenColor = Color(0xffFFF5F5);
  static const Color breathingStepsColor = Color(0xffE9460F);
  static const Color selectedColor = Color.fromARGB(255, 236, 154, 1);

  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xffF4650C), Color(0xffFC9658)], // Define the two colors
    begin: Alignment.centerLeft, // Adjust the gradient start point
    end: Alignment.centerRight, // Adjust the gradient end point
  );

  // static Color textcolour= Color(0xff5B6974);
  // static Color hintcolour= Color(0xffB4B4B4);
  // static Color textfieldbordercolor=Color(0xffE3E3E3);
}
