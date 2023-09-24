import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_spacer.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 200,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
          vSpace(),
          Text(title),
        ],
      ),
    );
  }
}
