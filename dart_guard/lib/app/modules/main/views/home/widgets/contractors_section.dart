import 'package:dart_guard/app/modules/main/views/home/widgets/title_section.dart';
import 'package:dart_guard/app/shared/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class ContractorsSection extends StatelessWidget {
  const ContractorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSection('Contratados'),
        SizedBox(height: 12),
        Container(
          height: 200,
          decoration: BoxDecoration(color: ThemeConstants.containerBackgroung, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.sentiment_dissatisfied, size: 60),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                      'Você ainda não possui seguros contratados.',
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
