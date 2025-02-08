import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mydiary/app/core/data/constants_data.dart';
import 'package:mydiary/app/shared/logics/tag_controller.dart';
import 'package:mydiary/app/utils/image_selector.dart';
import '../logic/entry_controller.dart';
import '../models/entry.dart';

import '../../../shared/widgets/buttons.dart';
import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';
import 'widgets/select_photo.dart';

class NewEntryScreen extends StatefulWidget {
  NewEntryScreen({super.key});

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  final EntryController entryController = Get.find<EntryController>();
  final TagController tagController = Get.find<TagController>();

  final List<String> images = [];

  String tag = '';

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  DateTime? createdDate;

  @override
  Widget build(BuildContext context) {
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
                title: "New Entry",
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: height / 65,
                ),
                child: SelectPhoto(
                  onTap: () async {
                    String? imagePath = await ImageSelector.select();
                    if (imagePath != null) {
                      setState(() {
                        images.add(imagePath);
                      });
                    }
                  },
                  images: images,
                ),
              ),
              TextField(
                controller: titleController,
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
                style: GoogleFonts.montserrat(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: height / 55,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  ).then((selectedDate) {
                    // After selecting the date, display the time picker.
                    if (selectedDate != null) {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((selectedTime) {
                        // Handle the selected date and time here.
                        if (selectedTime != null) {
                          setState(() {
                            createdDate = DateTime(
                              selectedDate.year,
                              selectedDate.month,
                              selectedDate.day,
                              selectedTime.hour,
                              selectedTime.minute,
                            );
                          });
                        }
                      });
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: height / 65),
                  child: Container(
                    height: height / 20,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      createdDate != null
                          ? DateFormat("dd-MMM-yyyy").format(createdDate!)
                          : "Please select a date",
                      style: GoogleFonts.montserrat(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: height / 55,
                      ),
                    ),
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
                    child: Obx(
                      () {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                tag = tagController.tags[index].value;
                              });
                            },
                            child: Container(
                              height: height / 30,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                  color: tagController.tags[index].value == tag
                                      ? Colors.green
                                      : AppColors.third,
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: Text(
                                entriesTag[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 5,
                          ),
                          itemCount: tagController.tags.length,
                        );
                      },
                    ),
                  )
                ],
              ),
              TextField(
                controller: descriptionController,
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
                style: GoogleFonts.montserrat(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: height / 55,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              BasicButton(
                height: height / 16,
                onTap: () {
                  log("Images before saving: $images"); // Debugging log

                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty &&
                      images.isNotEmpty && // Ensure images are selected
                      tag.isNotEmpty) {
                    Entry entry = Entry(
                      title: titleController.text.trim(),
                      tag: tag,
                      createdDate:
                          createdDate?.toString() ?? DateTime.now().toString(),
                      description: descriptionController.text.trim(),
                      imagePaths:
                          List<String>.from(images), // Ensure it's a new list
                    );

                    log("Saving Entry: ${entry.toMap()}"); // Debug log
                    entryController.saveEntry(entry);

                    // Clear UI state
                    titleController.clear();
                    descriptionController.clear();
                    setState(() {
                      images.clear();
                      tag = "";
                      createdDate = null;
                    });
                    Get.snackbar(
                      "Success",
                      "Entry was saved successfully",
                      backgroundColor: Colors.orange,
                      colorText: Colors.white,
                    );
                  } else {
                    Get.snackbar(
                      "Warning!",
                      "Please enter title, description, and select at least one image",
                      backgroundColor: Colors.orange,
                      colorText: Colors.white,
                    );
                  }
                },
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
