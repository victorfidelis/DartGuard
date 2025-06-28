import 'package:dart_guard/app/modules/main/views/home/widgets/title_section.dart';
import 'package:dart_guard/app/shared/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class MyFamilySection extends StatelessWidget {
  const MyFamilySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSection('Minha Família'),
        SizedBox(height: 12),
        Container(
          height: 200,
          decoration: BoxDecoration(color: ThemeConstants.containerBackgroung, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add_circle_outline, size: 60),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Adicione aqui membros da sua família e compartilhe os segudoros com eles.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
