import 'package:dart_guard/app/modules/auth/login/widgets/item_menu_login.dart';
import 'package:flutter/material.dart';

class MenuLogin extends StatefulWidget {
  const MenuLogin({super.key});

  @override
  State<MenuLogin> createState() => _MenuLoginState();
}

class _MenuLoginState extends State<MenuLogin> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ItemMenuLogin(label: 'Entrar', selected: true),
        SizedBox(width: 30),
        ItemMenuLogin(label: 'Cadastrar', selected: false),
      ],
    );
  }
}
