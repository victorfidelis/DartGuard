import 'package:flutter/material.dart';

class CustomCheck extends StatefulWidget {
  final String label;
  final bool initialValue;
  final Function(bool) onChange;
  const CustomCheck({super.key, required this.label, required this.initialValue, required this.onChange});

  @override
  State<CustomCheck> createState() => _CustomCheckState();
}

class _CustomCheckState extends State<CustomCheck> {
  bool currentValue = false;

  @override
  void initState() {
    currentValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentValue = !currentValue;
        });
        widget.onChange(currentValue);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(currentValue ? Icons.check_circle : Icons.circle_outlined, size: 28),
          ),
          Text(widget.label),
        ],
      ),
    );
  }
}
