import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydiary/app/features/entry/logic/entry_controller.dart';
import 'package:mydiary/app/shared/logics/tag_controller.dart';
import 'package:mydiary/app/shared/models/tag.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/app_icons.dart';

import '../../../shared/widgets/buttons.dart';
import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final TagController tagController = Get.find<TagController>();
  final EntryController entryController = Get.find<EntryController>();
  final TextEditingController tagEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.primary,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => Padding(
          padding: EdgeInsets.symmetric(
            vertical: height / 20,
            horizontal: width / 15,
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
                      content: SizedBox(
                        height: height * 0.14,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: tagEditingController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.dividerColor,
                                  ),
                                ),
                                hintText: "Tag name",
                              ),
                              style: GoogleFonts.montserrat(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: height / 55,
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
                                  onTap: () {
                                    if (tagEditingController.text.isNotEmpty) {
                                      tagController.saveTag(Tag(
                                          value: tagEditingController.text));
                                      tagEditingController.clear();
                                      Get.snackbar(
                                        "Success",
                                        "Tag was added successfully",
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                      );
                                      Navigator.of(context).pop();
                                    } else {
                                      Get.snackbar(
                                        "Warning!",
                                        "Please enter a tag",
                                        backgroundColor: Colors.orange,
                                        colorText: Colors.white,
                                      );
                                    }
                                  },
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
                      content: SizedBox(
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
                                  onTap: () {
                                    entryController.deleteEntries();
                                    Navigator.of(ctx).pop();
                                    Get.snackbar(
                                      "Success",
                                      "All entries were deleted successfully",
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white,
                                    );
                                  },
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
                                  onTap: () => Navigator.of(ctx).pop(),
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
