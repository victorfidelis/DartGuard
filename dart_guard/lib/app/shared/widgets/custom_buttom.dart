import 'package:dart_guard/app/shared/theme/theme_constants.dart';
import 'package:dart_guard/app/shared/widgets/custom_loading.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String label;
  final Function() onTap;
  final bool isLoading;
  const CustomButtom({super.key, required this.label, required this.onTap, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 150,
          height: 64,
          decoration: BoxDecoration(gradient: ThemeConstants.defaultGradient, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading ? CustomLoading() : Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}
