import 'package:dart_guard/app/modules/main/views/login/viewmodel/login_viewmodel.dart';
import 'package:dart_guard/app/modules/main/views/login/widgets/custom_check.dart';
import 'package:dart_guard/app/modules/main/views/login/widgets/forgot_password.dart';
import 'package:dart_guard/app/modules/main/views/login/widgets/login_mode_selector.dart';
import 'package:dart_guard/app/modules/main/views/login/widgets/login_button.dart';
import 'package:dart_guard/app/modules/main/views/login/widgets/login_text_field.dart';
import 'package:dart_guard/app/shared/formatters/cpf_input_formatters.dart';
import 'package:dart_guard/app/shared/widgets/custom_text_error.dart';
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
                        LoginTextField(
                          label: 'CPF',
                          controller: state.documentController,
                          inputFormatters: [CpfInputFormatter()],
                          error: state.errorDocument,
                        ),
                        const SizedBox(height: 10),
                        LoginTextField(
                          label: 'Senha',
                          controller: state.passwordController,
                          isPassword: true,
                          error: state.errorPassword,
                        ),
                        const SizedBox(height: 10),
                        state.loginError != null ? CustomTextError(message: state.loginError!) : SizedBox(),
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
                        LoginTextField(
                          label: 'NOME',
                          controller: state.registerNameController,
                          error: state.errorRegisterName,
                        ),
                        const SizedBox(height: 10),
                        LoginTextField(
                          label: 'EMAIL',
                          controller: state.registerEmailController,
                          isEmail: true,
                          error: state.errorRegisterEmail,
                        ),
                        const SizedBox(height: 10),
                        LoginTextField(
                          label: 'CPF',
                          controller: state.registerDocumentController,
                          inputFormatters: [CpfInputFormatter()],
                          error: state.errorRegisterDocument,
                        ),
                        const SizedBox(height: 10),
                        LoginTextField(
                          label: 'SENHA',
                          controller: state.registerPasswordController,
                          isPassword: true,
                          error: state.errorRegisterPassword,
                        ),
                        const SizedBox(height: 10),
                        LoginTextField(
                          label: 'CONFIRMAÇÃO DE SENHA',
                          controller: state.registerConfirmPasswordController,
                          isPassword: true,
                          error: state.errorRegisterConfirmPassword,
                        ),
                        const SizedBox(height: 10),
                        state.registerError != null ? CustomTextError(message: state.registerError!) : SizedBox(), 
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
                    return LoginButtom(
                      onTap: state.inLoginMode ? state.doLogin : state.doRegister,
                      isLoading: state.isLoading,
                    );
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
