import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  final String title;
  final TextStyle style;
  const AppBarText(
      {super.key,
      required this.title,
      this.style = const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 28,
      )});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
    );
  }
}

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle style;

  const CustomAppBar({
    super.key,
    required this.title,
    this.style = const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 28,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const AppBarBackButton(),
      centerTitle: true,
      title: AppBarText(
        title: title,
        style: style,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
