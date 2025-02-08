import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mydiary/app/shared/logics/tag_controller.dart';
import 'package:mydiary/app/shared/models/tag.dart';
import '../../../core/data/constants_data.dart';
import '../../../core/screens.dart';
import '../../../core/storage/shared_prefs_helper.dart';
import '../../../shared/widgets/buttons.dart';
import '../../profile/logic/profile_controller.dart';
import '../../../ui/app_icons.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/image_circle.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';
import '../../profile/ui/widgets/edit_button.dart';
import 'widgets/section_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  goToScreen(String page) => Get.toNamed(page);

  final ProfileController profileController = Get.find<ProfileController>();
  final TagController tagController = Get.find<TagController>();

  bool isNameEditable = false;
  bool isStatusEditable = false;

  String? imageUrl;
  String? fullName;
  String? status = "Happy ☺️";

  void selectImageForProfile() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageUrl = image.path;
        profileController.setProfile(
          SharedPreferencesKeys.imagePath.name,
          imageUrl!,
        );
      });
    }
  }

  final TextEditingController fullNameController = TextEditingController();

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
                Obx(
                  () {
                    if (profileController.profile.value.fullName.isEmpty) {
                      isNameEditable = true;
                      WidgetsBinding.instance.addPostFrameCallback(
                        (timeStamp) {
                          Get.dialog(Dialog(
                            backgroundColor: AppColors.secondary,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Stack(
                                    children: [
                                      Center(
                                        child: ImageCircle(
                                          imagePath: imageUrl,
                                          onTap: () => selectImageForProfile(),
                                        ),
                                      ),
                                      if (imageUrl == null)
                                        Positioned(
                                          bottom: 2,
                                          left: width * 0.32,
                                          child: Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              color: AppColors.secondary,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.camera_enhance,
                                              color: AppColors.third,
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (isNameEditable)
                                            SizedBox(
                                              width: width * 0.5,
                                              child: TextField(
                                                controller: fullNameController,
                                                style: GoogleFonts.montserrat(
                                                  color: AppColors.white,
                                                ),
                                                decoration: InputDecoration(
                                                  hintText:
                                                      "Please enter a name",
                                                ),
                                              ),
                                            )
                                          else
                                            Text(
                                              fullName.toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                              ),
                                            ),
                                          if (isNameEditable)
                                            IconButton(
                                                onPressed: () {
                                                  if (fullNameController
                                                      .text.isNotEmpty) {
                                                    fullName =
                                                        fullNameController.text;
                                                    profileController
                                                        .setProfile(
                                                      SharedPreferencesKeys
                                                          .fullName.name,
                                                      fullName!,
                                                    );
                                                    setState(() {
                                                      fullName =
                                                          fullNameController
                                                              .text;
                                                      isNameEditable = false;
                                                    });
                                                    Get.back();
                                                  } else {
                                                    Get.snackbar(
                                                      "Warning!",
                                                      "Please enter your name",
                                                      colorText: Colors.white,
                                                      backgroundColor:
                                                          Colors.amber,
                                                    );
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.check_circle_rounded,
                                                  color: AppColors.third,
                                                ))
                                          else
                                            EditButton(
                                              onTap: () => setState(() {
                                                isNameEditable =
                                                    !isNameEditable;
                                              }),
                                            )
                                        ],
                                      ),
                                      SizedBox(
                                        height: height / 85,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
                        },
                      );
                    }
                    return GestureDetector(
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
                            ImageCircle(
                              imagePath:
                                  profileController.profile.value.imagePath,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: height / 100),
                              child: Text(
                                profileController.profile.value.fullName,
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
                                profileController.profile.value.status,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height / 25,
                ),
                Container(
                  height: height * 0.38,
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
