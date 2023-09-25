import 'package:flutter/material.dart';
import 'package:my_cv/core/widgets/custom_vertical_line.dart';

import '../../../../core/constants/asset_manager.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/custom_spacer.dart';

class Education extends StatelessWidget {
  const Education({
    super.key,
    required this.myKey,
  });

  final GlobalKey myKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width > 835
          ? MediaQuery.of(context).size.height * .8
          : MediaQuery.of(context).size.width * 1.4,
      child: Flex(
        key: myKey,
        direction: MediaQuery.of(context).size.width > 835
            ? Axis.horizontal
            : Axis.vertical,
        children: [
          Expanded(child: Image.asset(AssetManager.me3)),
          Expanded(
            child: Column(
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
                    Text(
                      'Education',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: MyColors.myYellow),
                    ),
                  ],
                ),
                vSpace(),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Bachelor's degree from the Faculty of ",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 35,
                                ),
                      ),
                      TextSpan(
                        text: "Computers and Informations",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 35,
                                  color: MyColors.myYellow,
                                ),
                      )
                    ],
                  ),
                  maxLines: 7,
                ),
                vSpace(height: 30),
                Row(
                  children: [
                    const Icon(Icons.school, size: 50),
                    hSpace(width: 20),
                    Flexible(
                      child: Text(
                        "Assuit university",
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                vSpace(),
                Row(
                  children: [
                    const Icon(Icons.trending_up, size: 50),
                    hSpace(width: 20),
                    Text(
                      "GPA : 3.23",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
