import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydiary/app/ui/app_icons.dart';
import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/image_circle.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';
import '../logic/profile_controller.dart';
import 'widgets/zoo_item.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.primary,
      padding: EdgeInsets.zero,
      body: ResponsiveWidget(
        builder: (ctx, width, height) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: height / 25,
              horizontal: width / 15,
            ),
            child: Column(
              children: [
                TopBar(
                  title: "My Profile",
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: ImageCircle(),
                        ),
                        Positioned(
                          bottom: height * 0.1 / 20,
                          left: width * 0.388,
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: AppColors.secondary,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.camera_enhance,
                              color: AppColors.third,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: height * 0.1 / 15,
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Text(
                                  "Samantha Bell",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                                EditButton()
                              ],
                            ),
                          ),
                          Row(
                            children: [
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
                              EditButton()
                            ],
                          )
                        ],
                      ),
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
      ),
    );
  }
}


class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(height * 0.1 / 15),
          width: 25,
          height: 25,
          padding: EdgeInsets.all(height * 0.1 / 13),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.secondary,
          ),
          child: SvgPicture.asset(
            AppIcons.edit,
          ),
        ),
      ),
    );
  }
}
