import 'package:dart_guard/app/modules/main/models/hire.dart';
import 'package:dart_guard/app/shared/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class ContractCard extends StatelessWidget {
  final Contract hire;
  const ContractCard({super.key, required this.hire});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 110,
      decoration: BoxDecoration(
        color: ThemeConstants.containerBackgroung,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(hire.name, textAlign: TextAlign.center,),
      ),
    );
  }
}