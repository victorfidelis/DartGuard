import 'package:flutter/material.dart';

class CustomCheck extends StatefulWidget {
  final String label;
  final bool value;
  final Function(bool) onChange;
  const CustomCheck({super.key, required this.label, required this.value, required this.onChange});

  @override
  State<CustomCheck> createState() => _CustomCheckState();
}

class _CustomCheckState extends State<CustomCheck> {
  ValueNotifier<bool> currentValue = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    currentValue.value = widget.value;

    return GestureDetector(
      onTap: () {
        currentValue.value = !currentValue.value;
        widget.onChange(currentValue.value);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListenableBuilder(
              listenable: currentValue,
              builder: (context, _) {
                return Icon(
                  currentValue.value ? Icons.check_circle : Icons.circle_outlined,
                  size: 28,
                  color: Theme.of(context).colorScheme.primary,
                );
              }
            ),
          ),
          Text(widget.label),
        ],
      ),
    );
  }
}
