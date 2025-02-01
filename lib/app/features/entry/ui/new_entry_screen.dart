import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';
import '../models/animal.dart';

class NewEntryScreen extends StatelessWidget {
  const NewEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Animal animal = Get.arguments as Animal;
    return CustomScaffold(
      padding: EdgeInsets.zero,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(
                    left: height / 35,
                    right: height / 35,
                    bottom: height / 35,
                  ),
                  height: height / 2.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(animal.imgUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(height / 15),
                      bottomRight: Radius.circular(height / 15),
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(height / 15),
                        bottomRight: Radius.circular(height / 15),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(
                            0.4,
                          )
                        ],
                      ),
                    ),
                    height: height / 2.5,
                    width: width,
                  ),
                ),
                Positioned(
                    bottom: height / 30,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: animal.title,
                              style: GilroyTextStyle.style(
                                weight: FontWeight.bold,
                                size: height / 32,
                              ),
                              children: [
                                TextSpan(text: "\n"),
                                WidgetSpan(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: 10,
                                    ),
                                    width: width / 1.8,
                                    child: Text(
                                      animal.subTitle,
                                      style: GilroyTextStyle.style(
                                        size: height / 65,
                                        weight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          if (animal.status.length >= 2)
                            Row(
                              children: [
                                SvgPicture.asset("assets/svgs/danger.svg"),
                                SvgPicture.asset("assets/svgs/safe.svg"),
                              ],
                            ),
                          if (animal.status.contains("Carnivore"))
                            SvgPicture.asset("assets/svgs/danger.svg")
                          else
                            SvgPicture.asset("assets/svgs/safe.svg"),
                        ],
                      ),
                    )),
                Positioned(
                  top: height / 25,
                  left: width / 20,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: BackButton(
                      onPressed: () => Navigator.of(context).pop(),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(
                    top: height / 60,
                    left: width / 25,
                    right: width / 25,
                    bottom: height / 60),
                children: [
                  Text(
                    animal.description,
                    style: GilroyTextStyle.style(
                      color: AppColors.umber,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
