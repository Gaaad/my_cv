import 'package:flutter/material.dart';
import 'package:my_cv/core/widgets/custom_vertical_line.dart';
import 'package:my_cv/features/about_me/presentation/widgets/my_app_bar.dart';

import '../../../../core/constants/asset_manager.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/custom_spacer.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    super.key,
    required this.scrollController,
    required this.aboutMeKey,
    required this.educationKey,
    required this.skillsKey,
    required this.projectsKey,
    required this.contactKey,
  });

  final ScrollController scrollController;
  final GlobalKey aboutMeKey;
  final GlobalKey educationKey;
  final GlobalKey skillsKey;
  final GlobalKey projectsKey;
  final GlobalKey contactKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: aboutMeKey,
      children: [
        MyAppBar(
          aboutMeKey: aboutMeKey,
          educationKey: educationKey,
          skillsKey: skillsKey,
          projectsKey: projectsKey,
          contactKey: contactKey,
          scrollController: scrollController,
        ),
        vSpace(height: 70),
        SizedBox(
          height: MediaQuery.of(context).size.width > 835
              ? MediaQuery.of(context).size.height * .8
              : MediaQuery.of(context).size.width * 1.4,
          child: Flex(
            direction: MediaQuery.of(context).size.width > 835
                ? Axis.horizontal
                : Axis.vertical,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello, I'm Abdalrhman Gad",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: MyColors.myYellow),
                    ),
                    Text(
                      "Software Engineer | Flutter developer",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: MyColors.myYellow),
                    ),
                    vSpace(),
                    Row(
                      children: [
                        const CustomVerticalLine(
                          color: MyColors.myWhite,
                          height: 100,
                        ),
                        hSpace(),
                        const Flexible(
                          child: Text(
                            'Hardworking and motivated Flutter developer with 2 years experince, and a passion for creating innovative and user-friendly mobile apps. I am a strong leader and communicator. I am able to work effectively with others to achieve common goals. I am confident that I would be a valuable asset to your team.',
                            maxLines: 5,
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Image.asset(
                  AssetManager.me,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
