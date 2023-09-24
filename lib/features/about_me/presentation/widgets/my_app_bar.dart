import 'package:flutter/material.dart';
import 'package:my_cv/features/about_me/presentation/widgets/scroll_to_widget.dart';

import '../../../../core/constants/colors.dart';
import 'custom_text_button.dart';

enum SampleItem { about, education, skills, projects, contact }

// ignore: must_be_immutable
class MyAppBar extends StatelessWidget {
  MyAppBar({
    super.key,
    required this.scrollController,
    required this.aboutMeKey,
    required this.educationKey,
    required this.skillsKey,
    required this.projectsKey,
    required this.contactKey,
  });

  SampleItem? selectedMenu;

  final ScrollController scrollController;

  final GlobalKey aboutMeKey;
  final GlobalKey educationKey;
  final GlobalKey skillsKey;
  final GlobalKey projectsKey;
  final GlobalKey contactKey;

  final List<String> appBarButtons = [
    'About me',
    'Education',
    'Skills',
    'Projects',
    'Contact'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'P',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: MyColors.myYellow),
              ),
              TextSpan(
                text: 'ortfolio',
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
        ),
        MediaQuery.of(context).size.width < 835
            ? buildPopupMenu(context)
            : Row(
                children: [
                  ...button,
                ],
              ),
      ],
    );
  }

  PopupMenuButton<SampleItem> buildPopupMenu(BuildContext context) {
    return PopupMenuButton(
      initialValue: selectedMenu,
      onSelected: (SampleItem item) {
        switch (item) {
          case SampleItem.about:
            scrollToWidget(
              context: context,
              scrollController: scrollController,
              key: aboutMeKey,
            );
            break;
          case SampleItem.education:
            scrollToWidget(
              context: context,
              scrollController: scrollController,
              key: educationKey,
            );
            break;
          case SampleItem.skills:
            scrollToWidget(
              context: context,
              scrollController: scrollController,
              key: skillsKey,
            );
            break;
          case SampleItem.projects:
            scrollToWidget(
              context: context,
              scrollController: scrollController,
              key: projectsKey,
            );
            break;
          case SampleItem.contact:
            scrollToWidget(
              context: context,
              scrollController: scrollController,
              key: contactKey,
            );
        }
      },
      color: MyColors.myDark,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          value: SampleItem.about,
          child: Text(
            'About',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.education,
          child: Text(
            'Education',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.skills,
          child: Text(
            'Skills',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.projects,
          child: Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ],
      child: const Icon(
        Icons.menu,
        color: MyColors.myWhite,
      ),
    );
  }

  List<Widget> get button {
    List<Widget> x = List.generate(
      appBarButtons.length,
      (index) {
        return CustomTextButton(
          aboutMeKey: aboutMeKey,
          educationKey: educationKey,
          skillsKey: skillsKey,
          projectsKey: projectsKey,
          contactKey: contactKey,
          title: appBarButtons[index],
          scrollController: scrollController,
        );
      },
    );
    return x;
  }
}
