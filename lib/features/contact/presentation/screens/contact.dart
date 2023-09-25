import 'package:flutter/material.dart';
import 'package:my_cv/core/widgets/custom_spacer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/asset_manager.dart';

class Contact extends StatelessWidget {
  const Contact({super.key, required this.myKey});

  final GlobalKey myKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: myKey,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: _lanchLinkedIn,
              child: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  AssetManager.linkerIn2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            hSpace(width: 20),
            InkWell(
              onTap: _lanchGithub,
              child: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  AssetManager.github,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            hSpace(width: 20),
            InkWell(
              onTap: _lanchEmail,
              child: const Icon(Icons.email, size: 50),
            ),
            hSpace(width: 20),
            InkWell(
              onTap: _launchPhone,
              child: const Icon(Icons.phone, size: 50),
            ),
          ],
        ),
        vSpace(),
        Text(
          'Abdalrhman Gad 2023',
          style: Theme.of(context).textTheme.headlineMedium,
        )
      ],
    );
  }

  _launchPhone() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: '+201095725810',
    );

    if (await canLaunchUrl(phoneLaunchUri)) {
      await launchUrl(phoneLaunchUri);
    } else {
      throw 'Could not launch phone';
    }
  }

  _lanchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'gadwork44@gmail.com',
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch email';
    }
  }

  _lanchLinkedIn() async {
    final linkedInLaunchUri =
        Uri.parse('https://www.linkedin.com/in/abdalrhman-gad-06514b253/');

    if (await canLaunchUrl(linkedInLaunchUri)) {
      await launchUrl(linkedInLaunchUri);
    } else {
      throw 'Could not launch linkedIn';
    }
  }

  _lanchGithub() async {
    final githubLaunchUri = Uri.parse('https://github.com/Gaaad');

    if (await canLaunchUrl(githubLaunchUri)) {
      await launchUrl(githubLaunchUri);
    } else {
      throw 'Could not launch linkedIn';
    }
  }
}
