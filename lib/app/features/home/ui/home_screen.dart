import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydiary/app/core/screens.dart';
import 'package:mydiary/app/features/exports.dart';
import 'package:mydiary/app/ui/app_icons.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/image_circle.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';
import 'widgets/section_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  goToScreen(String page) => Get.toNamed(page);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.primary,
      padding: EdgeInsets.zero,
      body: ResponsiveWidget(
        builder: (ctx, width, height) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width / 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(Screens.profile),
                  child: Container(
                    height: height * 0.35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageCircle(),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: height / 100),
                          child: Text(
                            "Samantha Bell",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
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
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                Container(
                  height: height * 0.32,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: height / 95),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SectionButton(
                        iconPath: AppIcons.newEntry,
                        onClick: () => goToScreen(Screens.newEntry),
                        text: "New Entry",
                      ),
                      Divider(
                        color: AppColors.dividerColor,
                        thickness: 2,
                      ),
                      SectionButton(
                        iconPath: AppIcons.myEntries,
                        onClick: () => goToScreen(Screens.myEntries),
                        text: "My Entries",
                      ),
                      Divider(
                        color: AppColors.dividerColor,
                        thickness: 2,
                      ),
                      SectionButton(
                        iconPath: AppIcons.settings,
                        onClick: () => goToScreen(Screens.settings),
                        text: "Settings",
                      ),
                      Divider(
                        color: AppColors.dividerColor,
                        thickness: 2,
                      ),
                      SectionButton(
                        iconPath: AppIcons.about,
                        onClick: () => goToScreen(Screens.about),
                        text: "AboutUs",
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
