import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydiary/app/features/exports.dart';

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
          page: () => const HomeScreen(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: Screens.myEntries,
          page: () => const MyEntriesScreen(),
        ),
        GetPage(
          name: Screens.newEntry,
          page: () => const NewEntryScreen(),
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
