import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/storage/shared_prefs_helper.dart';
import '../logic/profile_controller.dart';
import '../../../shared/widgets/buttons.dart';
import '../../../core/data/constants_data.dart';
import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/image_circle.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';
import 'widgets/edit_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNameEditable = false;
  bool isStatusEditable = false;

  final ProfileController profileController = Get.find<ProfileController>();

  String? imageUrl;
  String? fullName;
  String? status;

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
          return Obx(
            () {
              fullName = profileController.profile.value.fullName;
              status = profileController.profile.value.status;
              imageUrl = profileController.profile.value.imagePath;
              if (fullName!.isEmpty) {
                isNameEditable = true;
              }

              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height / 25,
                  horizontal: width / 15,
                ),
                child: ListView(
                  children: [
                    TopBar(
                      title: "My Profile",
                    ),
                    SizedBox(
                      height: height / 70,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: ImageCircle(
                                imagePath: imageUrl,
                                onTap: () => selectImageForProfile(),
                              ),
                            ),
                            Positioned(
                              bottom: height * 0.1 / -20,
                              left: width * 0.388,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (isNameEditable)
                                  SizedBox(
                                    width: width * 0.45,
                                    child: TextField(
                                      controller: fullNameController,
                                      style: GoogleFonts.montserrat(
                                        color: AppColors.white,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: "Name",
                                      ),
                                    ),
                                  )
                                else
                                  Text(
                                    fullName!,
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
                                          fullName = fullNameController.text;
                                          profileController.setProfile(
                                            SharedPreferencesKeys.fullName.name,
                                            fullName!,
                                          );
                                          setState(() {
                                            fullName = fullNameController.text;
                                            isNameEditable = false;
                                          });
                                        } else {
                                          Get.snackbar(
                                            "Warning!",
                                            "Please enter your name",
                                            colorText: Colors.white,
                                            backgroundColor: Colors.amber,
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
                                      isNameEditable = !isNameEditable;
                                    }),
                                  )
                              ],
                            ),
                            SizedBox(
                              height: height / 85,
                            ),
                            if (isStatusEditable)
                              SizedBox(
                                width: width,
                                height: height / 30,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: 5,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: statuses.length,
                                  itemBuilder: (context, index) => StatusButton(
                                    status: statuses[index],
                                    onTap: (sts) {
                                      profileController.setProfile(
                                        SharedPreferencesKeys.status.name,
                                        sts,
                                      );
                                      setState(() {
                                        status = sts;
                                        isStatusEditable = false;
                                      });
                                    },
                                  ),
                                ),
                              )
                            else
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: height / 30,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                        color: AppColors.third,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      status!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  EditButton(
                                    onTap: () => setState(() {
                                      isStatusEditable = true;
                                    }),
                                  )
                                ],
                              )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: height / 25,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "About me",
                        style: GoogleFonts.montserrat(
                          color: AppColors.dividerColor,
                          fontSize: height / 50,
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.secondary,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      maxLines: 8,
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
