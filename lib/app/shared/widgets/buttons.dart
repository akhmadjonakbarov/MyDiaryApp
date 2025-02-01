import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';
import 'responsive_widget.dart';

class BasicButton extends StatelessWidget {
  final Function() onClick;
  final String title;

  const BasicButton({super.key, required this.onClick, required this.title});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => GestureDetector(
        child: GestureDetector(
          onTap: onClick,
          child: Container(
            margin: EdgeInsets.only(bottom: height / 45),
            alignment: Alignment.center,
            height: height / 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                height / 85,
              ),
              boxShadow: [
                BoxShadow(color: AppColors.redShadow, offset: Offset(0, 5))
              ],
              color: AppColors.red,
            ),
            child: Text(
              title,
              style: GilroyTextStyle.style(
                color: AppColors.yellow,
                size: height / 44,
                weight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
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
