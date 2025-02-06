import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/core/storage/sql_database_manager.dart';

import 'app/app.dart';
import 'app/core/storage/shared_prefs_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefsHelper sharedPrefsHelper = SharedPrefsHelper();
  SQLDatabaseManager sqlDatabaseManager = SQLDatabaseManager();
  await sharedPrefsHelper.init();

  Get.put(sharedPrefsHelper);
  Get.put(sqlDatabaseManager);
  runApp(const MyApp());
}
