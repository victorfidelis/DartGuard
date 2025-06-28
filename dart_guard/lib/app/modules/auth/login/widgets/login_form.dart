import 'package:dart_guard/app/modules/auth/login/viewmodel/login_viewmodel.dart';
import 'package:dart_guard/app/modules/auth/login/widgets/custom_check.dart';
import 'package:dart_guard/app/modules/auth/login/widgets/forgot_password.dart';
import 'package:dart_guard/app/modules/auth/login/widgets/login_mode_selector.dart';
import 'package:dart_guard/app/modules/auth/login/widgets/login_button.dart';
import 'package:dart_guard/app/modules/auth/widgets/auth_text_field.dart';
import 'package:dart_guard/app/shared/formatters/cpf_input_formatters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 24, top: 30, right: 24, bottom: 12),
              decoration: BoxDecoration(
                color: Color(0xff2c2b3b),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              ),
              child: Consumer<LoginViewmodel>(
                builder: (context, state, _) {
                  final menuLogin = Row(
                    children: [
                      LoginModeSelector(label: 'Entrar', selected: state.inLoginMode, onTap: state.setToLoginMode),
                      SizedBox(width: 30),
                      LoginModeSelector(
                        label: 'Cadastrar',
                        selected: state.inRegisterMode,
                        onTap: state.setToRegisterMode,
                      ),
                    ],
                  );

                  if (state.inLoginMode) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        menuLogin,
                        const SizedBox(height: 30),
                        AuthTextField(
                          label: 'CPF',
                          controller: state.documentController,
                          inputFormatters: [CpfInputFormatter()],
                        ),
                        const SizedBox(height: 10),
                        AuthTextField(label: 'Senha', controller: state.passwordController, isPassword: true),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: CustomCheck(label: 'Lembrar sempre', initialValue: false, onChange: (value) {}),
                            ),
                            ForgotPassword(),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        menuLogin,
                        const SizedBox(height: 30),
                        AuthTextField(label: 'EMAIL', controller: state.registerEmailcontroller, isEmail: true),
                        const SizedBox(height: 10),
                        AuthTextField(
                          label: 'CPF',
                          controller: state.registerDocumentcontroller,
                          inputFormatters: [CpfInputFormatter()],
                        ),
                        const SizedBox(height: 10),
                        AuthTextField(label: 'SENHA', controller: state.registerPasswordController, isPassword: true),
                        const SizedBox(height: 10),
                        AuthTextField(
                          label: 'CONFIRMAÇÃO DE SENHA',
                          controller: state.registerConfirmPasswordController,
                          isPassword: true,
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xff2c2b3b),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                  ),
                ),
                Consumer<LoginViewmodel>(
                  builder: (context, state, _) {
                    return LoginButtom(onTap: state.doLogin, isLoading: state.isLoading);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
