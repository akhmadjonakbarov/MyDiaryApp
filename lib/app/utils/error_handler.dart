import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorHandler {
  static void show(String error) {
    log(error);
    Get.snackbar(
      duration: Duration(seconds: 3),
      "Error",
      "Failed to fetch notes: $error",
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
