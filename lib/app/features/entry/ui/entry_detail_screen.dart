import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydiary/app/features/entry/logic/entry_controller.dart';
import 'package:mydiary/app/shared/widgets/buttons.dart';
import 'package:mydiary/app/ui/app_icons.dart';
import 'package:share_plus/share_plus.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';
import '../models/entry.dart';

class EntryDetailScreen extends StatelessWidget {
  EntryDetailScreen({super.key});

  final EntryController entryController = Get.find<EntryController>();

  @override
  Widget build(BuildContext context) {
    final Entry entry = Get.arguments as Entry;
    List<XFile> imagePaths = entry.imagePaths
        .map(
          (e) => XFile(e),
        )
        .toList();

    return CustomScaffold(
      backgroundColor: AppColors.primary,
      padding: EdgeInsets.zero,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => Padding(
          padding: EdgeInsets.symmetric(
            vertical: height / 20,
            horizontal: width / 15,
          ),
          child: ListView(
            children: [
              TopBar(
                title: "My Entries",
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () async {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: height * 0.15,
                                decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BasicButton(
                                      height: height / 25,
                                      width: width * 0.3,
                                      onTap: () async {
                                        await Share.shareXFiles(imagePaths);
                                      },
                                      child: Text(
                                        "Share Image",
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: height / 55,
                                        ),
                                      ),
                                    ),
                                    BasicButton(
                                      height: height / 25,
                                      width: width * 0.3,
                                      onTap: () async {
                                        await Share.share(
                                          "${entry.title} \n\n\n\n\n\n ${entry.description}",
                                        );
                                      },
                                      child: Text(
                                        "Share Text",
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: height / 55,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.share_rounded),
                        color: AppColors.third,
                      ),
                      GestureDetector(
                        onTap: () {
                          entryController.deleteEntry(entry.id!);
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(
                          AppIcons.trash,
                          color: AppColors.third,
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    width: width,
                    margin: EdgeInsets.only(top: 5),
                    height: height / 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.secondary,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      entry.title,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: height / 45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: StatusButton(
                      status: entry.tag,
                    ),
                  )
                ],
              ),
              CarouselSlider(
                items: entry.imagePaths.map(
                  (e) {
                    return Container(
                      height: height / 4,
                      width: width,
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(
                          height / 85,
                        ),
                      ),
                      child: Image.file(
                        File(e),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ).toList(),
                options: CarouselOptions(
                  height: height / 4,
                  autoPlay: true,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(height / 85),
                ),
                child: Text(
                  entry.description,
                  style: GoogleFonts.montserrat(
                    fontSize: height / 65,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
