import 'package:dart_guard/app/modules/main/services/login/login_service.dart';
import 'package:dart_guard/app/modules/main/views/reset_password/viewmodel/reset_password_viewmodel.dart';
import 'package:dart_guard/app/shared/formatters/cpf_input_formatters.dart';
import 'package:dart_guard/app/shared/widgets/custom_buttom.dart';
import 'package:dart_guard/app/shared/widgets/custom_text_error.dart';
import 'package:dart_guard/app/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late final ResetPasswordViewmodel viewmodel;

  @override
  void initState() {
    viewmodel = ResetPasswordViewmodel(loginService: context.read<LoginService>());
    super.initState();
  }

  @override
  void dispose() {
    viewmodel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alteração de senha')),
      body: Center(
        child: SizedBox(
          width: 400,
          child: ListenableBuilder(
            listenable: viewmodel,
            builder: (context, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(viewmodel.emailSent ? 'E-mail enviado' : 'Informe o seu CPF', style: TextStyle(fontSize: 24)),
                    SizedBox(height: 40),
                    viewmodel.emailSent
                        ? Text(
                          'Link para alteração de senha enviado para ${viewmodel.email!}!',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        )
                        : CustomTextField(
                          key: ValueKey('resetPasswordDocumentField'),
                          controller: viewmodel.documentController,
                          label: 'CPF',
                          error: viewmodel.errorDocument,
                          inputFormatters: [CpfInputFormatter()],
                        ),
                    SizedBox(height: 20),
                    viewmodel.error != null ? CustomTextError(message: viewmodel.error!) : SizedBox(),
                    SizedBox(height: 40),
                    viewmodel.emailSent
                        ? CustomButtom(label: 'Voltar', onTap: _popView, isLoading: false)
                        : CustomButtom(label: 'Confirmar', onTap: viewmodel.doConfirm, isLoading: viewmodel.isLoading),
                    SizedBox(height: 60),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _popView() {
    Navigator.pop(context);
  }
}
