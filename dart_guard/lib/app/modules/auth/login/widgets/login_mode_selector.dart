import 'package:flutter/material.dart';

class LoginModeSelector extends StatelessWidget {
  final String label;
  final bool selected;
  final Function() onTap;
  const LoginModeSelector({super.key, required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    if (selected) {
      textStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
        decoration: TextDecoration.underline,
        decorationColor: Theme.of(context).colorScheme.primary,
        decorationThickness: 2,
      );
    } else {
      textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    }

    return GestureDetector(onTap: onTap, child: Text(label, style: textStyle));
  }
}
