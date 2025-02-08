import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydiary/app/features/entry/ui/entry_detail_screen.dart';
import 'features/exports.dart';

import 'core/screens.dart';
import 'features/home/logic/home_bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Diary App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Screens.home,
      getPages: [
        GetPage(
          name: Screens.home,
          page: () => HomeScreen(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: Screens.myEntries,
          page: () => MyEntriesScreen(),
        ),
        GetPage(
          name: Screens.newEntry,
          page: () => NewEntryScreen(),
        ),
        GetPage(
          name: Screens.entryDetail,
          page: () => EntryDetailScreen(),
        ),
        GetPage(
          name: Screens.settings,
          page: () => SettingsScreen(),
        ),
        GetPage(
          name: Screens.about,
          page: () => AboutScreen(),
        ),
        GetPage(
          name: Screens.profile,
          page: () => ProfileScreen(),
        ),
      ],
    );
  }
}
