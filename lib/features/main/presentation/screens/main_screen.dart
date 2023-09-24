import 'package:flutter/material.dart';
import 'package:my_cv/core/constants/asset_manager.dart';
import 'package:my_cv/core/widgets/custom_spacer.dart';
import 'package:my_cv/features/about_me/presentation/screens/about_me_screen.dart';

import '../../../education/presentation/screens/education.dart';
import '../../../projects/presentation/screens/projects_screen.dart';
import '../../../skills/presentation/screens/skills.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _scrollController = ScrollController();
  final _aboutMeKey = GlobalKey();
  final _educationKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  List skills = [
    'Flutter',
    'Firebase',
    'Dealing with Api',
    'Bloc',
    'My SQL',
    'C#',
  ];
  List images = [
    AssetManager.flutter,
    AssetManager.firebase,
    AssetManager.api,
    AssetManager.block,
    AssetManager.mySql,
    AssetManager.cSharp,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGroungImage(),
          SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AboutMe(
                  aboutMeKey: _aboutMeKey,
                  educationKey: _educationKey,
                  skillsKey: _skillsKey,
                  projectsKey: _projectsKey,
                  contactKey: _contactKey,
                  scrollController: _scrollController,
                ),
                vSpace(height: 120),
                Education(myKey: _educationKey),
                vSpace(height: 120),
                Skills(myKey: _skillsKey, skills: skills, images: images),
                vSpace(height: 120),
                Projects(myKey: _projectsKey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ColorFiltered backGroungImage() {
    return ColorFiltered(
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
      child: Image.asset(
        AssetManager.bg,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
