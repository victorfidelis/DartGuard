import 'package:dart_guard/app/modules/main/views/home/widgets/title_section.dart';
import 'package:flutter/material.dart';

class MyFamilySection extends StatelessWidget {
  const MyFamilySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [TitleSection('Minha Família')],);
  }
}