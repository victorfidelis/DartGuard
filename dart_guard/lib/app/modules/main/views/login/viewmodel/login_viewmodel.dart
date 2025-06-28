import 'package:dart_guard/app/modules/main/models/user.dart';
import 'package:dart_guard/app/modules/main/services/login/login_service.dart';
import 'package:dart_guard/app/shared/either/either.dart';
import 'package:flutter/material.dart';

enum LoginMode { login, register }

class LoginViewmodel extends ChangeNotifier {
  LoginService loginService;
  final Function(User user) onSuccessfulLogin;
  
  LoginViewmodel({required this.loginService, required this.onSuccessfulLogin});

  LoginMode loginMode = LoginMode.login;
  bool isLoading = false;

  final TextEditingController documentController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerDocumentController = TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();
  final TextEditingController registerConfirmPasswordController = TextEditingController();

  String? loginError;
  String? registerError;

  String? errorDocument;
  String? errorPassword;

  String? errorRegisterDocument;
  String? errorRegisterEmail;
  String? errorRegisterPassword;
  String? errorRegisterConfirmPassword;

  @override
  void dispose() {
    documentController.dispose();
    passwordController.dispose();
    registerEmailController.dispose();
    registerDocumentController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();
    super.dispose();
  }

  bool get inLoginMode => loginMode == LoginMode.login;
  void setToLoginMode() {
    loginMode = LoginMode.login;
    notifyListeners();
  }

  bool get inRegisterMode => loginMode == LoginMode.register;
  void setToRegisterMode() {
    loginMode = LoginMode.register;
    notifyListeners();
  }

  void setToLoading() {
    isLoading = true;
    notifyListeners();
  }

  void setToLoaded() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> doLogin() async {
    if (!_validateLogin()) {
      return;
    }

    setToLoading();

    final signInEither = await loginService.signIn(
      document: documentController.text,
      password: passwordController.text,
    );
    if (signInEither.isLeft) {
      loginError = signInEither.left!.message;
    } else {
      onSuccessfulLogin(signInEither.right!);
    }

    setToLoaded();
  }

  bool _validateLogin() {
    _clearErrors();
    bool isValid = true;

    if (documentController.text.isEmpty) {
      errorDocument = 'Informe o CPF';
      isValid = false;
    } else if (documentController.text.replaceAll(RegExp(r'\D'), '').length != 11) {
      errorDocument = 'CPF inválido';
      isValid = false;
    }

    if (passwordController.text.isEmpty) {
      errorPassword = 'Informe a senha';
      isValid = false;
    } else if (passwordController.text.length < 6) {
      errorPassword = 'Senha muito curta';
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }

  Future<void> doRegister() async {
    if (!_validateRegister()) {
      return;
    }

    setToLoading();
    await Future.delayed(Duration(seconds: 5));
    setToLoaded();
  }

  bool _validateRegister() {
    _clearErrors();
    bool isValid = true;

    if (registerEmailController.text.isEmpty) {
      errorRegisterEmail = 'Informe o e-mail';
      isValid = false;
    } else if (!registerEmailController.text.contains('@')) {
      errorRegisterEmail = 'E-mail inválido';
      isValid = false;
    }

    if (registerDocumentController.text.isEmpty) {
      errorRegisterDocument = 'Informe o CPF';
      isValid = false;
    } else if (registerDocumentController.text.replaceAll(RegExp(r'\D'), '').length != 11) {
      errorRegisterDocument = 'CPF inválido';
      isValid = false;
    }

    if (registerPasswordController.text.isEmpty) {
      errorRegisterPassword = 'Informe a senha';
      isValid = false;
    } else if (registerPasswordController.text.length < 6) {
      errorRegisterPassword = 'Senha deve ter ao menos 6 caracteres';
      isValid = false;
    }

    if (registerConfirmPasswordController.text != registerPasswordController.text) {
      errorRegisterConfirmPassword = 'Senhas não coincidem';
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }

  void _clearErrors() {
    loginError = null;
    registerError = null;
    errorDocument = null;
    errorPassword = null;
    errorRegisterDocument = null;
    errorRegisterEmail = null;
    errorRegisterPassword = null;
    errorRegisterConfirmPassword = null;
  }
}
