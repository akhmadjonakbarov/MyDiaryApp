import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'responsive_widget.dart';

class ImageCircle extends StatelessWidget {
  const ImageCircle({super.key, this.imagePath, this.onTap});
  final String? imagePath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => GestureDetector(
          onTap: onTap,
          child: imagePath == null || imagePath!.isEmpty
              ? Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'Please select your image!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: height / 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(height),
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    height: 180,
                    width: 180,
                    child: Image.file(
                      File(
                        imagePath!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
    );
  }
}
