import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../ui/app_icons.dart';

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
    return ResponsiveWidget(
      builder: (ctx, width, height) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(
                AppIcons.arrowBack,
                color: Colors.white,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: height / 45,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox.shrink()
          ],
        );
      },
    );
  }
}
