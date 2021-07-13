import 'package:flutter/material.dart';

class AppColors {
  static Color textDark = Color(0xff5f4f7e);
  static Color textLight = Color(0xff6e81e3);
  static Color textDescription = Color(0xffacc0d6);

  static Gradient gradientAccent = LinearGradient(colors: [
    Color(0xffea5ab8),
    Color(0xfffc93ab),
  ]);

  static Gradient gradientPrimary = LinearGradient(
    colors: [
      Color(0xff6e81e3),
      Color(0Xffc26de4),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
