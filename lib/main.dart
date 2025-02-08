import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydiary/app/shared/logics/tag_controller.dart';


import 'app/app.dart';
import 'app/core/storage/shared_prefs_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPrefsHelper sharedPrefsHelper = SharedPrefsHelper();
  await sharedPrefsHelper.init();
  Get.put(sharedPrefsHelper);
  Get.put(TagController());

  runApp(const MyApp());
}
