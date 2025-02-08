import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mydiary/app/core/screens.dart';
import 'package:mydiary/app/features/entry/logic/entry_controller.dart';
import 'package:mydiary/app/features/entry/models/entry.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';

class MyEntriesScreen extends StatelessWidget {
  MyEntriesScreen({super.key});

  final EntryController entryController = Get.find<EntryController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      backgroundColor: AppColors.primary,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => ListView(
          padding: EdgeInsets.symmetric(
            vertical: height / 15,
            horizontal: width / 25,
          ),
          children: [
            TopBar(
              title: "My Entries",
            ),
            SizedBox(
              height: height / 90,
            ),
            Obx(
              () {
                if (entryController.entries.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: entryController.entries.length,
                    itemBuilder: (context, index) {
                      Entry entry = entryController.entries[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            Screens.entryDetail,
                            arguments: entry,
                          );
                        },
                        child: Container(
                          height: height * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.secondary,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(height / 80),
                                decoration:
                                    BoxDecoration(color: Colors.transparent),
                                height: height * 0.15,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: DateTime.parse(entry.createdDate)
                                            .day
                                            .toString(),
                                        style: GoogleFonts.montserrat(
                                          fontSize: height / 40,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                " ${DateFormat("MMM").format(DateTime.parse(entry.createdDate))}",
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        entry.tag,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: height / 55,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(top: height * 0.1 / 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      entry.title,
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
                                        entry.description,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: height / 65,
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: height * 0.1 / 25),
                                      width: width * 0.52,
                                      height: height / 11,
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          width: 5,
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            Container(
                                          height: 35,
                                          width: width / 6,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Image.file(
                                            File(
                                              entry.imagePaths![index],
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        itemCount: entry.imagePaths!.length,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.only(top: height * 0.4),
                    alignment: Alignment.center,
                    child: Text(
                      "You don't have any entries",
                      style: GoogleFonts.montserrat(
                          color: AppColors.white,
                          fontSize: height / 45,
                          fontWeight: FontWeight.w800),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
