import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/widgets/buttons.dart';
import '../../shared/widgets/custom_scaffold.dart';
import '../../shared/widgets/responsive_widget.dart';
import '../../ui/app_colors.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> sendMail(String mail) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: mail,
      queryParameters: {
        'subject': 'Greetings',
        'body': Uri.encodeComponent('Hello World'),
      },
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Could not launch $uri'); // Replace with proper error handling
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.background,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width / 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BasicButton(
                onClick: () => _launchUrl(''),
                title: "About App",
              ),
              BasicButton(
                onClick: () => _launchUrl('https://www.google.com'),
                title: "Privacy Policy",
              ),
              BasicButton(
                onClick: () {},
                title: "Terms of Use",
              ),
              BasicButton(
                onClick: () => sendMail('example@gmail.com'),
                title: "Contact us",
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Privacy policy -> open https://www.google.com
// Terms of use -> open https://www.google.com
// Contact us -> mail to example@gmail.com
// About app - Hide button
