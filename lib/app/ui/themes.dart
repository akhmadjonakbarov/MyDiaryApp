import 'package:flutter/material.dart';

import 'app_colors.dart';

class DefaultLinearGradient {
  static LinearGradient linerGradient({
    List<Color> colors = const [
      GradientColors.blueFirst,
      GradientColors.blueSecond,
    ],
    Alignment begin = Alignment.centerLeft,
    Alignment end = Alignment.centerRight,
  }) {
    return LinearGradient(
      colors: colors,
      begin: begin,
      end: end,
    );
  }
}
