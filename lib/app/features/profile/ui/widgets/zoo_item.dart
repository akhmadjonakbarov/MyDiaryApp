import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/widgets/responsive_widget.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';
import '../../models/profile.dart';

class ZooItem extends StatelessWidget {
  final Zoo place;

  const ZooItem({
    super.key,
    required this.place,
  });

  Future<void> openGoogleMaps(double lat, double lng) async {
    final Uri googleMapsUri =
        Uri.parse("https://www.google.com/maps?q=$lat,$lng");

    if (await canLaunchUrl(googleMapsUri)) {
      await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not open Google Maps";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => Container(
        padding: EdgeInsets.all(8),
        height: height / 6.5,
        decoration: BoxDecoration(
            color: AppColors.zooBack, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    place.images!.first,
                  ),
                ),
              ),
              width: width / 3.6,
            ),
            SizedBox(
              width: width * 0.1 / 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(
                          Icons.star_half_outlined,
                          color: Colors.yellowAccent,
                        ),
                      ],
                    ),
                    Text(
                      "4.1 (25 Reviews)",
                      style: GilroyTextStyle.style(
                          color: AppColors.umber, size: height / 65),
                    ),
                    SizedBox(
                      width: width * 0.1 / 3,
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 95,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width / 2,
                      child: Text(
                        place.name,
                        overflow: TextOverflow.ellipsis,
                        style: GilroyTextStyle.style(
                          weight: FontWeight.w600,
                          color: AppColors.umber,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.primary,
                        ),
                        SizedBox(
                          width: width / 2,
                          child: Text(
                            place.location.formattedAddress.isNotEmpty
                                ? place.location.formattedAddress
                                : "Unknown",
                            overflow: TextOverflow.ellipsis,
                            style: GilroyTextStyle.style(
                              size: height / 65,
                              color: AppColors.umber,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    openGoogleMaps(place.geocodes.main.latitude,
                        place.geocodes.main.longitude);
                  },
                  child: Container(
                    width: width / 2,
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset("assets/svgs/map.svg"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
