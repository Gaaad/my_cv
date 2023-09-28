// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.title,
    required this.body,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  final String title, body, image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width > 835
          ? MediaQuery.of(context).size.width * .3
          : MediaQuery.of(context).size.width * 1.3,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.myYellow.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Flex(
        direction: MediaQuery.of(context).size.width > 835
            ? Axis.horizontal
            : Axis.vertical,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    body,
                    textAlign: TextAlign.justify,
                    maxLines: 5,
                  ),
                  ElevatedButton(
                    onPressed: onTap,
                    child: const Text('View project'),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FancyShimmerImage(
                  imageUrl: image,
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
