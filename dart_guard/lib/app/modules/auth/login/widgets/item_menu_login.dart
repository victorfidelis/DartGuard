import 'package:flutter/material.dart';

class ItemMenuLogin extends StatelessWidget {
  final String label;
  final bool selected;
  const ItemMenuLogin({super.key, required this.label, required this.selected});

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

    return Text(label, style: textStyle);
  }
}
