import 'package:flutter/material.dart';

class GilroyTextStyle {
  static TextStyle style({
    String family = 'Gilroy',
    Color color = Colors.white,
    double size = 16,
    FontWeight weight = FontWeight.w600,
  }) {
    return TextStyle(
      fontFamily: family,
      color: color,
      fontWeight: weight,
      fontSize: size,
    );
  }
}
