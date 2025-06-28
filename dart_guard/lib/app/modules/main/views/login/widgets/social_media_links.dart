import 'package:flutter/material.dart';

class SocialMediaLinks extends StatelessWidget {
  const SocialMediaLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Acesse através das redes sociais'),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google_icon.png',
              fit: BoxFit.fitHeight,
              height: 28,
            ),
            SizedBox(width: 40),
            Image.asset(
              'assets/images/facebook_icon.png',
              fit: BoxFit.fitHeight,
              height: 28,
            ),
            SizedBox(width: 40),
            Image.asset(
              'assets/images/twitter_icon.png',
              fit: BoxFit.fitHeight,
              height: 28,
            ),
          ],
        ),
      ],
    );
  }
}
