import 'package:flutter/material.dart';

import 'responsive_widget.dart';

class ImageCircle extends StatelessWidget {
  const ImageCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => Container(
        height: height * 0.2,
        width: width * 0.38,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
