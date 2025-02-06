import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.third,
            borderRadius: BorderRadius.circular(
              10,
            )),
        height: height,
        width: width,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

class StatusButton extends StatelessWidget {
  const StatusButton(
      {super.key,
      this.onTap,
      this.status,
      this.containerHeight,
      this.containerWidth});
  final Function(String status)? onTap;
  final String? status;

  final double? containerHeight;
  final double? containerWidth;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => GestureDetector(
        onTap: () => onTap!(status!),
        child: Container(
          height: containerHeight ?? height / 30,
          width: containerWidth ?? width * 0.3,
          decoration: BoxDecoration(
              color: AppColors.third, borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: Text(
            status!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
