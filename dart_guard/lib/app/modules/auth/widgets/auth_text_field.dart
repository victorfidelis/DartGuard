import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool isPassword;
  final String? error;
  final bool isEmail;

  const AuthTextField({
    super.key,
    required this.label,
    this.controller,
    this.isPassword = false,
    this.error,
    this.isEmail = false,
  });

  
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: label,
        errorText: error,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide(width: 0)),
      ),
      textAlign: TextAlign.center,
      keyboardType: _keyboardType(),
      obscureText: isPassword,
      controller: controller,
    );
  }

  TextInputType _keyboardType() {
    if (isPassword) {
      return TextInputType.visiblePassword;
    } else {
      return TextInputType.text;
    }
  }
}