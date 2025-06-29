import 'package:dart_guard/app/modules/main/models/contract.dart';
import 'package:dart_guard/app/modules/main/views/home/widgets/contract_card.dart';
import 'package:dart_guard/app/modules/main/views/home/widgets/title_section.dart';
import 'package:dart_guard/app/shared/notifications/custom_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContractSection extends StatefulWidget {
  const ContractSection({super.key});

  @override
  State<ContractSection> createState() => _ContractSectionState();
}

class _ContractSectionState extends State<ContractSection> {
  late final CustomNotifications notifications;

  @override
  void initState() {
    notifications = context.read<CustomNotifications>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(left: 24), child: TitleSection('Cotar e Contratar')),
        SizedBox(
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 24),
              ContractCard(contract: Contract(name: 'Automóvel', image: 'car.png'), onTap: onSelectAutomobile),
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

  void onSelectAutomobile() {
    if (kIsWeb) {
      context.read<CustomNotifications>().showSnackBar(
        context: context,
        message: 'Função disponível apenas para android.',
      );

      return;
    }

    Navigator.pushNamed(context, '/webview', arguments: {'url': 'https://nava.com.br/'});
  }
}
