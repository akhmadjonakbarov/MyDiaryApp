import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydiary/app/shared/widgets/headers.dart';
import 'package:mydiary/app/ui/app_colors.dart';
import 'package:widgets_easier/widgets_easier.dart';

import '../../../shared/widgets/buttons.dart';
import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/responsive_widget.dart';

class NewEntryScreen extends StatelessWidget {
  const NewEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.primary,
      padding: EdgeInsets.zero,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => Padding(
          padding: EdgeInsets.symmetric(
            vertical: height / 25,
            horizontal: width / 15,
          ),
          child: ListView(
            children: [
              TopBar(
                title: "New Entry",
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: height / 65,
                ),
                child: SelectPhoto(
                  onTap: () {},
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Title",
                  hintStyle: GoogleFonts.montserrat(
                    color: AppColors.dividerColor,
                    fontWeight: FontWeight.w500,
                    fontSize: height / 55,
                  ),
                  filled: true,
                  fillColor: AppColors.secondary,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height / 65),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Title",
                    hintStyle: GoogleFonts.montserrat(
                      color: AppColors.dividerColor,
                      fontWeight: FontWeight.w500,
                      fontSize: height / 55,
                    ),
                    filled: true,
                    fillColor: AppColors.secondary,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select tag",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.montserrat(
                      color: AppColors.dividerColor,
                      fontWeight: FontWeight.w500,
                      fontSize: height / 60,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    alignment: Alignment.center,
                    height: height / 30,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
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
                      separatorBuilder: (context, index) => SizedBox(
                        width: 5,
                      ),
                      itemCount: 25,
                    ),
                  )
                ],
              ),
              TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Text",
                  hintStyle: GoogleFonts.montserrat(
                    color: AppColors.dividerColor,
                    fontWeight: FontWeight.w500,
                    fontSize: height / 55,
                  ),
                  filled: true,
                  fillColor: AppColors.secondary,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              BasicButton(
                height: height / 16,
                onTap: () {},
                child: Text(
                  "Save Entry",
                  style: GoogleFonts.montserrat(
                    color: AppColors.white,
                    fontSize: height / 60,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectPhoto extends StatelessWidget {
  const SelectPhoto({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: height * 0.2,
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: DashedBorder(
              color: AppColors.dividerColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: height / 10,
                width: width * 0.18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.dividerColor,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.camera_alt,
                  size: 35,
                  color: AppColors.background,
                ),
              ),
              Text(
                "Add photo",
                style: GoogleFonts.montserrat(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: height / 55,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
