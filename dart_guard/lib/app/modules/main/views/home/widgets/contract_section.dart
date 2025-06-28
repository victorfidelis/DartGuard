import 'package:dart_guard/app/modules/main/models/hire.dart';
import 'package:dart_guard/app/modules/main/views/home/widgets/contract_card.dart';
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
          child: Text('Cotar e Contratar', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
        ),
        SizedBox(
          height: 120,
          child: ListView(scrollDirection: Axis.horizontal, children: [
              SizedBox(width: 24),
              ContractCard(hire: Contract(name: 'Automóvel', image: '')),
              SizedBox(width: 10),
              ContractCard(hire: Contract(name: 'Residência', image: '')),
              SizedBox(width: 10),
              ContractCard(hire: Contract(name: 'Vida', image: '')),
              SizedBox(width: 10),
              ContractCard(hire: Contract(name: 'Acidentes Pessoais', image: '')),
              SizedBox(width: 24),
            ],
          ),
        ),
      ],
    );
  }
}
