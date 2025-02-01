import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.padding,
    this.appBar,
    this.backgroundColor = AppColors.background,
  });

  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: Padding(
        padding: padding != null
            ? padding!
            : EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.02,
                vertical: MediaQuery.sizeOf(context).height / 35,
              ),
        child: body,
      ),
    );
  }
}
