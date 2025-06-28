import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Esqueceu a senha?', style: TextStyle(color: Theme.of(context).colorScheme.primary));
  }
}
