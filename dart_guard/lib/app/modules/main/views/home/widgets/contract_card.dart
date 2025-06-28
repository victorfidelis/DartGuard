import 'package:dart_guard/app/modules/main/models/contract.dart';
import 'package:dart_guard/app/shared/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class ContractCard extends StatelessWidget {
  final Contract contract;
  final Function()? onTap;
  const ContractCard({super.key, required this.contract, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: 110,
        decoration: BoxDecoration(color: ThemeConstants.containerBackgroung, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50, width: 50, child: Image.asset('assets/images/${contract.image}', fit: BoxFit.contain)),
              SizedBox(height: 4),
              Text(contract.name, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
