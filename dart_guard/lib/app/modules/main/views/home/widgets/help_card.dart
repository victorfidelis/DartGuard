import 'package:dart_guard/app/modules/main/views/home/widgets/user_image.dart';
import 'package:dart_guard/app/shared/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class HelpCard extends StatelessWidget {
  const HelpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(gradient: ThemeConstants.defaultGradient),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50, child: UserImage()),
              SizedBox(height: 8),
              Text(
                'Dúvidas?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text('Envie um e-mail para xpto_123456@email.com', textAlign: TextAlign.center),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
