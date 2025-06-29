import 'package:dart_guard/app/modules/main/services/login/login_service.dart';
import 'package:dart_guard/app/shared/either/either.dart';
import 'package:flutter/material.dart';

class ResetPasswordViewmodel extends ChangeNotifier {
  LoginService loginService;

  ResetPasswordViewmodel({required this.loginService});

  bool isLoading = false;
  String? email;

  final TextEditingController documentController = TextEditingController();
  String? errorDocument;

  String? error;

  @override
  void dispose() {
    documentController.dispose();
    super.dispose();
  }

  void setToLoading() {
    isLoading = true;
    notifyListeners();
  }

  void setToLoaded() {
    isLoading = false;
    notifyListeners();
  }

  bool get emailSent => email != null;

  Future<void> doConfirm() async {
    if (!_validateResetPassword()) {
      return;
    }

    setToLoading();

    final sendEmailEither = await loginService.sendPasswordResetEmail(document: documentController.text);
    if (sendEmailEither.isLeft) {
        error = sendEmailEither.left!.message;
    } else {
        email = sendEmailEither.right!;
    }

    setToLoaded();
  }

  bool _validateResetPassword() {
    _clearErrors();
    bool isValid = true;
    
    if (documentController.text.trim().isEmpty) {
      errorDocument = 'Informe o CPF';
      isValid = false;
    } else if (documentController.text.replaceAll(RegExp(r'\D'), '').length != 11) {
      errorDocument = 'CPF inválido';
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }

  void _clearErrors() {
    errorDocument = null;
    error = null;
  }
}
