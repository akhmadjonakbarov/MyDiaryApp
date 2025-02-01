import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';
import 'responsive_widget.dart';

class TopBar extends StatelessWidget {
  final String title;

  final List<Widget>? children;

  const TopBar({
    super.key,
    required this.title,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (ctx, width, height) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.umber,
            ),
          ),
          Text(
            title,
            style: GilroyTextStyle.style(
              color: AppColors.umber,
              size: height / 45,
              weight: FontWeight.w600,
            ),
          ),
          SizedBox.shrink()
        ],
      );
    });
  }
}
