import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/widgets/responsive_widget.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';
import '../../models/animal.dart';

class AnimalItem extends StatelessWidget {
  final Function() onClick;
  final Animal animal;

  const AnimalItem({super.key, required this.onClick, required this.animal});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => GestureDetector(
        onTap: onClick,
        child: Container(
            padding: EdgeInsets.zero,
            height: height / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height / 35),
              border: Border.all(color: AppColors.red, width: 3),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(constraints.maxHeight / 10),
                    child: SizedBox(
                      width: constraints.maxWidth,
                      child: CachedNetworkImage(
                        imageUrl: animal.imgUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(constraints.maxHeight / 10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(
                              0.5,
                            )
                          ],
                        ),
                      ),
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                    ),
                  ),
                  Positioned(
                    bottom: height / 50,
                    left: width / 25,
                    child: SizedBox(
                      width: width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            animal.title,
                            style: GilroyTextStyle.style(size: height / 35),
                          ),
                          Transform.rotate(
                            angle: 3.1,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: height / 65,
                    right: width / 5.5,
                    child: Row(
                      children: [
                        if (animal.status.length >= 2)
                          Row(
                            children: [
                              SvgPicture.asset("assets/svgs/danger.svg"),
                              SvgPicture.asset("assets/svgs/safe.svg"),
                            ],
                          )
                        else if (animal.status.contains("Carnivore"))
                          SvgPicture.asset("assets/svgs/danger.svg")
                        else
                          SvgPicture.asset("assets/svgs/safe.svg"),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
