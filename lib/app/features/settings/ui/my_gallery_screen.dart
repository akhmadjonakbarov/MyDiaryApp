import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mydiary/app/ui/app_colors.dart';
import 'package:mydiary/app/ui/app_icons.dart';

import '../../../core/screens.dart';
import '../../../shared/widgets/buttons.dart';
import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';

import 'widgets/gallery_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.primary,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => Padding(
          padding: EdgeInsets.symmetric(
            vertical: height / 30,
            horizontal: width / 25,
          ),
          child: Column(
            children: [
              TopBar(title: "Setting"),
              SizedBox(
                height: height / 25,
              ),
              BasicButton(
                height: height / 16,
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      backgroundColor: AppColors.secondary,
                      content: Container(
                        height: height * 0.14,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.dividerColor,
                                  ),
                                ),
                                hintText: "Tag name",
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BasicButton(
                                  height: height / 25,
                                  width: width * 0.25,
                                  onTap: () => Navigator.of(ctx).pop(),
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: height / 55,
                                    ),
                                  ),
                                ),
                                BasicButton(
                                  height: height / 25,
                                  width: width * 0.25,
                                  onTap: () {},
                                  child: Text(
                                    "Save",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: height / 55,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.tag),
                    SizedBox(
                      width: width * 0.1 / 4,
                    ),
                    Text(
                      "Create Tag",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: height / 44,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height / 65,
              ),
              BasicButton(
                height: height / 16,
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      backgroundColor: AppColors.secondary,
                      content: Container(
                        height: height * 0.14,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Text(
                                "Are you sure you want to clear all history?",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: height / 50,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BasicButton(
                                  height: height / 25,
                                  width: width * 0.25,
                                  onTap: () => Navigator.of(ctx).pop(),
                                  child: Text(
                                    "Yes",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: height / 55,
                                    ),
                                  ),
                                ),
                                BasicButton(
                                  height: height / 25,
                                  width: width * 0.25,
                                  onTap: () {},
                                  child: Text(
                                    "No",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: height / 55,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.trash),
                    SizedBox(
                      width: width * 0.1 / 4,
                    ),
                    Text(
                      "Clear Diary",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: height / 44,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
