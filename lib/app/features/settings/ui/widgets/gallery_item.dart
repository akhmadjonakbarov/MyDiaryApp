import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../shared/widgets/responsive_widget.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';

class GalleryItem extends StatelessWidget {
  final String title;
  final String date;
  final String image;

  const GalleryItem({
    super.key,
    required this.title,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: constraints.minHeight * 0.7,
                  child: Image.file(
                    File(image),
                    fit: BoxFit.cover,
                    width: constraints.maxWidth,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.1 / 2,
                  ),
                  width: constraints.maxWidth,
                  height: constraints.minHeight * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: constraints.minHeight * 0.02,
                      ),
                      Text(
                        title,
                        style: GilroyTextStyle.style(
                            color: AppColors.umber, size: height / 55),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          date,
                          style: GilroyTextStyle.style(
                            color: AppColors.umber,
                            size: height / 75,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
