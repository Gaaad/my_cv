import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cv/features/skills/business_logic/grid_view_controller.dart';
import 'package:my_cv/features/skills/business_logic/skills_controller.dart';
import 'package:my_cv/features/skills/presentation/widgets/skill_card.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/custom_spacer.dart';
import '../../../../core/widgets/custom_vertical_line.dart';
import '../../data/api/skill_services.dart';
import '../../data/models/skill.dart';
import '../../data/repository/skill_repo.dart';

// ignore: must_be_immutable
class Skills extends StatelessWidget {
  Skills({
    super.key,
    required this.myKey,
  }) {
    skillsController =
        Get.put(SkillsController(skillRepository: skillRepository));
  }

  final GlobalKey myKey;

  final SkillRepository skillRepository =
      SkillRepository(skillServices: SkillServices());

  late SkillsController skillsController;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: myKey,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
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
                  'WHAT I PROVIDE?',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.grey.withOpacity(0.2)),
                ),
                Text(
                  'Skills',
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
        GetBuilder<SkillsController>(
          builder: (_) {
            List<Skill> skills = skillsController.getSkills();

            return GetX<GridViewController>(
              init: GridViewController(),
              builder: (controller) {
                controller.gridWidth.value = MediaQuery.of(context).size.width;
                //(device width / card width) .Truncate()
                int gridHorizontalCount = controller.gridWidth.value ~/ 220;
                //(skills length / grid horizontal count) * (card height + paddings)
                double gridVerticalHeight =
                    (skills.length / gridHorizontalCount).ceil() * 320;

                return SizedBox(
                  height: gridVerticalHeight,
                  child: DynamicHeightGridView(
                    itemCount: skills.length,
                    crossAxisCount: gridHorizontalCount,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    builder: (ctx, index) {
                      return Column(
                        children: [
                          if (index % 2 == 1) vSpace(),
                          SkillCard(
                            image: skills[index].imageUrl,
                            title: skills[index].name,
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
