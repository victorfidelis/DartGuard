import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool isPassword;
  final String? error;
  final bool isEmail;
  final List<TextInputFormatter> inputFormatters;

  const LoginTextField({
    super.key,
    required this.label,
    this.controller,
    this.isPassword = false,
    this.error,
    this.isEmail = false,
    this.inputFormatters = const [],
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
      inputFormatters: inputFormatters,
    );
  }

  TextInputType _keyboardType() {
    if (isEmail) {
      return TextInputType.emailAddress;
    } else if (isPassword) {
      return TextInputType.visiblePassword;
    } else {
      return TextInputType.text;
    }
  }
}