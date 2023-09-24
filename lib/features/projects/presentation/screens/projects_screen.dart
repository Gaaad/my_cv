import 'package:flutter/material.dart';
import 'package:my_cv/core/constants/asset_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/custom_spacer.dart';
import '../../../../core/widgets/custom_vertical_line.dart';
import '../widgets/project_card.dart';

class Projects extends StatelessWidget {
  Projects({
    super.key,
    required this.myKey,
  });

  final GlobalKey myKey;

  final List<Map> projects = [
    {
      'title': 'Cozy Corner',
      'body':
          "Cozy Corner is a software application that allows users to  offer or book different kinds of properties for rent or sale. The app allows users to list and advertise their available properties, browse for properties through various options, compare prices and locations, and make reservations.",
      'image': AssetManager.cozyCorner,
      'url':
          'https://www.linkedin.com/posts/abdalrhman-gad-06514b253_flutter-flutterdevelopment-appdevelopment-activity-7087511003256516608-Ut9O?utm_source=share&utm_medium=member_desktop',
    },
    {
      'title': 'Home Mart',
      'body':
          "Home Mart application is an E-commerce app that allows you to buy many kinds of products easily and at competitive prices, and orders will be delivered to your place inside Assiut - El Qusiya.",
      'image': AssetManager.homeMart,
      'url':
          'https://play.google.com/store/apps/details?id=com.ctempurl.homeMart',
    },
    {
      'title': 'Gad Storm',
      'body':
          "Developed a weather app that provides users with accurate and up-to-date weather information for their location and three more locations of their choice. Used an API to collect weather data. Implemented a user-friendly interface that allows users to easily find the information they need.",
      'image': AssetManager.gadStorm,
      'url':
          'https://www.linkedin.com/posts/abdalrhman-gad-06514b253_flutter-mobileappdevelopment-activity-7061205803755610112-KiCP?utm_source=share&utm_medium=member_desktop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      key: myKey,
      children: [
        Row(
          children: [
            const CustomVerticalLine(
              color: MyColors.myWhite,
              height: 25,
              width: 3,
            ),
            hSpace(),
            Stack(
              children: [
                Text(
                  'WHAT I Developed?',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.grey.withOpacity(0.2)),
                ),
                Text(
                  'Projects',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 25, color: MyColors.myYellow),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
        vSpace(height: 30),
        ...projects.map(
          (e) => Column(
            children: [
              ProjectCard(
                  title: e['title'],
                  body: e['body'],
                  image: e['image'],
                  onTap: () async {
                    if (!await launchUrl(Uri.parse(e['url']))) {
                      throw Exception("Could not launch $e['url]");
                    }
                  }),
              vSpace(),
            ],
          ),
        ),
      ],
    );
  }
}
