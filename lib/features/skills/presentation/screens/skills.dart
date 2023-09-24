import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cv/features/skills/business_logic/grid_view_controller.dart';
import 'package:my_cv/features/skills/presentation/widgets/skill_card.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/custom_spacer.dart';
import '../../../../core/widgets/custom_vertical_line.dart';

class Skills extends StatelessWidget {
  const Skills({
    super.key,
    required this.skills,
    required this.images,
    required this.myKey,
  });

  final List skills;
  final List images;

  final GlobalKey myKey;

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
        GetX<GridViewController>(
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
                          image: images[index % skills.length],
                          title: skills[index % skills.length],
                        ),
                      ],
                    );
                  },
                ),
              );
            }),
      ],
    );
  }
}
