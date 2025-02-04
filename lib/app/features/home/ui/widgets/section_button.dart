import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/widgets/responsive_widget.dart';
import '../../../../ui/app_colors.dart';

class SectionButton extends StatelessWidget {
  final Function() onClick;
  final String text;
  final String iconPath;

  const SectionButton(
      {super.key,
      required this.onClick,
      required this.text,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => InkWell(
        onTap: onClick,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width / 25,
            vertical: height / 55,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(iconPath),
                  SizedBox(
                    width: width * 0.1 / 2,
                  ),
                  Text(
                    text,
                    style: GoogleFonts.montserrat(
                        color: AppColors.white,
                        fontSize: height / 55,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Transform.rotate(
                angle: 3.1,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.third,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
