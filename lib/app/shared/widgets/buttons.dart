import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';
import 'responsive_widget.dart';

class BasicButton extends StatelessWidget {
  final double height;
  final double width;
  final Function() onTap;
  final Widget child;

  const BasicButton(
      {super.key,
      required this.height,
      this.width = double.infinity,
      required this.onTap,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.third,
          borderRadius: BorderRadius.circular(
            10,
          )),
      height: height,
      width: width,
      alignment: Alignment.center,
      child: child,
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(Icons.arrow_back_ios),
    );
  }
}
