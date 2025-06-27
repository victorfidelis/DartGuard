import 'package:dart_guard/app/modules/auth/login/widgets/custom_check.dart';
import 'package:dart_guard/app/modules/auth/login/widgets/forgot_password.dart';
import 'package:dart_guard/app/modules/auth/login/widgets/login_button.dart';
import 'package:dart_guard/app/modules/auth/login/widgets/menu_login.dart';
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
      body: Center(
        child: SizedBox(
          height: 420,
          width: 350,
          child: Stack(
            children: [
              _buildBody(),
              Positioned(top: 334, child: SizedBox(width: 350, child: LoginButtom(onTap: () {})))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Container(
        width: 350,
        height: 320,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        decoration: BoxDecoration(
          color: Color(0xff2c2b3b),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Color(0xff101010), offset: Offset(0, 6), spreadRadius: -2, blurRadius: 4)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MenuLogin(),
            const SizedBox(height: 30),
            AuthTextField(label: 'CPF', controller: documentController),
            const SizedBox(height: 10),
            AuthTextField(label: 'Senha', controller: passwordController, isPassword: true),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(child: CustomCheck(label: 'Lembrar sempre', initialValue: false, onChange: (value) {})),
                ForgotPassword(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
