import 'package:flutter/material.dart';
import 'package:mydiary/app/shared/widgets/headers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/widgets/custom_scaffold.dart';
import '../../shared/widgets/responsive_widget.dart';
import '../../ui/app_colors.dart';
import '../../ui/app_icons.dart';
import '../home/ui/widgets/section_button.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _launchUrl({String url = 'https://www.google.com/'}) async {
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
      padding: EdgeInsets.zero,
      backgroundColor: AppColors.primary,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => Padding(
          padding: EdgeInsets.symmetric(
            vertical: height / 15,
            horizontal: width / 15,
          ),
          child: Column(
            children: [
              TopBar(title: "About Us"),
              SizedBox(
                height: height / 25,
              ),
              Container(
                height: height * 0.25,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: height * 0.1 / 50),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SectionButton(
                      iconPath: AppIcons.contactUs,
                      onClick: () {
                        sendMail("test@example.com");
                      },
                      text: "Contact Us",
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                    ),
                    SectionButton(
                      iconPath: AppIcons.privacyPolicy,
                      onClick: () {
                        _launchUrl();
                      },
                      text: "Privacy Policy",
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                    ),
                    SectionButton(
                      iconPath: AppIcons.privacyPolicy,
                      onClick: () {
                        _launchUrl();
                      },
                      text: "Terms of Use",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
