import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/widgets/responsive_widget.dart';
import '../../../../ui/app_colors.dart';
import '../../models/entry.dart';

class EntryItem extends StatelessWidget {
  final Function() onClick;
  final Entry entry;

  const EntryItem({
    super.key,
    required this.onClick,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => GestureDetector(
        onTap: onClick,
        child: Container(
          height: height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.secondary,
          ),
          child: Row(
            children: [
              EntryDateWithTag(),
              EntryHead(),
            ],
          ),
        ),
      ),
    );
  }
}

class EntryHead extends StatelessWidget {
  const EntryHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => Container(
        padding: EdgeInsets.only(top: height * 0.1 / 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "My day",
              style: GoogleFonts.montserrat(
                color: AppColors.white,
                fontSize: height / 35,
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              width: width * 0.5,
              // height: ,
              child: Text(
                "Lorem ipsum  ipsumipsumipsumipsumipsumdolor sit amet consectetur...amet consectetur...amet consectetur...amet consectetur...amet consectetur...amet consectetur...amet consectetur...",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  fontSize: height / 65,
                  color: AppColors.textGrey,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.1 / 25),
              width: width * 0.52,
              height: height / 11,
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                  width: 5,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  height: 35,
                  width: width / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green,
                  ),
                ),
                itemCount: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EntryDateWithTag extends StatelessWidget {
  const EntryDateWithTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => Container(
        padding: EdgeInsets.all(height / 80),
        decoration: BoxDecoration(color: Colors.transparent),
        height: height * 0.15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
              text: TextSpan(
                text: "05",
                style: GoogleFonts.montserrat(
                  fontSize: height / 40,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: " Jan",
                    style: GoogleFonts.montserrat(
                      fontSize: height / 40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height / 30,
              width: width * 0.3,
              decoration: BoxDecoration(
                  color: AppColors.third,
                  borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: Text(
                "Happy",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
