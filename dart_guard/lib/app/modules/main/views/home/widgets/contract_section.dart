import 'package:dart_guard/app/modules/main/models/hire.dart';
import 'package:dart_guard/app/modules/main/views/home/widgets/contract_card.dart';
import 'package:dart_guard/app/modules/main/views/home/widgets/title_section.dart';
import 'package:flutter/material.dart';

class ContractSection extends StatelessWidget {
  const ContractSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: TitleSection('Cotar e Contratar'),
        ),
        SizedBox(
          height: 130,
          child: ListView(scrollDirection: Axis.horizontal, children: [
              SizedBox(width: 24),
              ContractCard(contract: Contract(name: 'Automóvel', image: 'car.png')),
              SizedBox(width: 10),
              ContractCard(contract: Contract(name: 'Residência', image: 'house.png')),
              SizedBox(width: 10),
              ContractCard(contract: Contract(name: 'Vida', image: 'heart.png')),
              SizedBox(width: 10),
              ContractCard(contract: Contract(name: 'Acidentes Pessoais', image: 'crutch.png')),
              SizedBox(width: 24),
            ],
          ),
        ),
      ],
    );
  }
}
