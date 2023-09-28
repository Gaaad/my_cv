import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cv/core/constants/asset_manager.dart';
import 'package:my_cv/features/projects/business_logic/projects_controller.dart';
import 'package:my_cv/features/projects/data/api/project_services.dart';
import 'package:my_cv/features/projects/data/models/project.dart';
import 'package:my_cv/features/projects/data/repository/project_repo.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/custom_spacer.dart';
import '../../../../core/widgets/custom_vertical_line.dart';
import '../widgets/project_card.dart';

// ignore: must_be_immutable
class Projects extends StatelessWidget {
  Projects({
    super.key,
    required this.myKey,
  }) {
    projectController =
        Get.put(ProjectController(projectRepository: projectRepository));
  }

  final GlobalKey myKey;

  final ProjectRepository projectRepository =
      ProjectRepository(projectServices: ProjectsServices());

  late ProjectController projectController;

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
        GetBuilder<ProjectController>(
          builder: (projectController) {
            List<Project> projects = projectController.getProjects();

            return Column(
              children: projects.map((e) {
                return Column(
                  children: [
                    ProjectCard(
                      title: e.name,
                      body: e.description,
                      image: e.imageUrl,
                      onTap: () async {
                        // if (!await launchUrl(Uri.parse(e.url))) {
                        //   throw Exception("Could not launch ${e.url}");
                        // }
                      },
                    ),
                    const SizedBox(
                        height:
                            16), // You can replace this with your desired spacing widget
                  ],
                );
              }).toList(),
            );
          },
        )
      ],
    );
  }
}
