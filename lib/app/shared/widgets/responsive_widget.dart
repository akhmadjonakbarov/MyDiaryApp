import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext ctx, double width, double height) builder;
  const ResponsiveWidget({super.key, required this.builder});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return builder(context, size.width, size.height);
  }
}
