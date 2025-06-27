import 'package:dart_guard/app/modules/auth/login/widgets/login_button.dart';
import 'package:dart_guard/app/modules/auth/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController documentController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    documentController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: buildLoginControls(),
    );
  }


  Widget buildLoginControls() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AuthTextField(label: 'CPF', controller: documentController),
            const SizedBox(height: 18),
            AuthTextField(label: 'Senha', controller: passwordController, isPassword: true),
            const SizedBox(height: 50),
            LoginButtom(onTap: () {}, label: 'Entrar'),
          ],
        ),
      ),
    );
  }

}
