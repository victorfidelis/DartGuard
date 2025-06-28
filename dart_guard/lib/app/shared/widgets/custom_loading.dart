import 'package:flutter/material.dart';

class CustomLoading extends StatefulWidget {
  final Color? color;
  const CustomLoading({super.key, this.color});

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading> {
  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).colorScheme.onSurface;
    return CircularProgressIndicator(color: color);
  }
}