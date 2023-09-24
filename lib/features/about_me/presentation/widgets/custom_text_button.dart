import 'package:flutter/material.dart';
import 'package:my_cv/features/about_me/presentation/widgets/scroll_to_widget.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.scrollController,
    required this.aboutMeKey,
    required this.educationKey,
    required this.skillsKey,
    required this.projectsKey,
    required this.contactKey,
  });

  final String title;
  final ScrollController scrollController;
  final GlobalKey aboutMeKey;
  final GlobalKey educationKey;
  final GlobalKey skillsKey;
  final GlobalKey projectsKey;
  final GlobalKey contactKey;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        switch (title) {
          case 'About me':
            scrollToWidget(
              context: context,
              scrollController: scrollController,
              key: aboutMeKey,
            );
            break;
          case 'Education':
            scrollController.animateTo(
              MediaQuery.of(context).size.height,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            break;
          case 'Skills':
            scrollController.animateTo(
              MediaQuery.of(context).size.height * 2,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            break;
          case 'Projects':
            scrollController.animateTo(
              MediaQuery.of(context).size.height * 3,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            break;
          case 'Contact':
            scrollController.animateTo(
              MediaQuery.of(context).size.height * 4,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
        }
      },
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
