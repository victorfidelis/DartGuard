import 'package:flutter/material.dart';

class CustomTextLink extends StatelessWidget {
  final String label;
  final Function() onTap;
  const CustomTextLink({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(label, style: TextStyle(color: Theme.of(context).colorScheme.primary)),
    );
  }
}
