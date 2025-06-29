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

  final TextEditingController registerNameController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerDocumentController = TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();
  final TextEditingController registerConfirmPasswordController = TextEditingController();

  String? loginError;
  String? registerError;

  String? errorDocument;
  String? errorPassword;

  String? errorRegisterName;
  String? errorRegisterEmail;
  String? errorRegisterDocument;
  String? errorRegisterPassword;
  String? errorRegisterConfirmPassword;

  @override
  void dispose() {
    documentController.dispose();
    passwordController.dispose();
    registerNameController.dispose();
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
      _clearControllers();
    }

    setToLoaded();
  }

  bool _validateLogin() {
    _clearErrors();
    bool isValid = true;

    if (documentController.text.trim().isEmpty) {
      errorDocument = 'Informe o CPF';
      isValid = false;
    } else if (documentController.text.replaceAll(RegExp(r'\D'), '').length != 11) {
      errorDocument = 'CPF inválido';
      isValid = false;
    }

    if (passwordController.text.trim().isEmpty) {
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

    final user = User(
      id: '',
      name: registerNameController.text,
      email: registerEmailController.text,
      document: registerDocumentController.text,
      profilePicture: '',
    );

    setToLoading();

    final registerEither = await loginService.registerUser(
      user: user,
      password: registerPasswordController.text,
    );
    if (registerEither.isLeft) {
      registerError = registerEither.left!.message;
    } else {
      setToLoginMode();
      _clearControllers();
    }

    setToLoaded();
  }

  bool _validateRegister() {
    _clearErrors();
    bool isValid = true;

    if (registerNameController.text.trim().isEmpty) {
      errorRegisterName = 'Informe o nome';
      isValid = false;
    }

    if (registerDocumentController.text.trim().isEmpty) {
      errorRegisterDocument = 'Informe o CPF';
      isValid = false;
    } else if (registerDocumentController.text.replaceAll(RegExp(r'\D'), '').length != 11) {
      errorRegisterDocument = 'CPF inválido';
      isValid = false;
    }

    if (registerEmailController.text.trim().isEmpty) {
      errorRegisterEmail = 'Informe o e-mail';
      isValid = false;
    } else if (!registerEmailController.text.contains('@')) {
      errorRegisterEmail = 'E-mail inválido';
      isValid = false;
    }

    if (registerPasswordController.text.trim().isEmpty) {
      errorRegisterPassword = 'Informe a senha';
      isValid = false;
    } else if (registerPasswordController.text.length < 6) {
      errorRegisterPassword = 'Senha deve ter pelo menos 6 caracteres';
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
    errorRegisterName = null;
    errorRegisterEmail = null;
    errorRegisterDocument = null;
    errorRegisterPassword = null;
    errorRegisterConfirmPassword = null;
  }

  void _clearControllers() {
    documentController.clear();
    passwordController.clear();
    registerNameController.clear();
    registerEmailController.clear();
    registerDocumentController.clear();
    registerPasswordController.clear();
    registerConfirmPasswordController.clear();
  }
}
