import 'package:flutter/material.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';

class MyEntriesScreen extends StatelessWidget {
  const MyEntriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      backgroundColor: AppColors.background,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => ListView(
          padding: EdgeInsets.symmetric(
            vertical: height / 30,
            horizontal: width / 25,
          ),
          children: [
            TopBar(
              title: "Learn more about animals",
            ),
          ],
        ),
      ),
    );
  }
}
