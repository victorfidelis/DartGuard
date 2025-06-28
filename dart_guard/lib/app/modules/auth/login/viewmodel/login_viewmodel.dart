import 'package:flutter/material.dart';

enum LoginMode {
  login,
  register
}

class LoginViewmodel extends ChangeNotifier {
  LoginMode loginMode = LoginMode.login;
  bool isLoading = false;

  final TextEditingController documentController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  final TextEditingController registerEmailcontroller = TextEditingController();
  final TextEditingController registerDocumentcontroller = TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();
  final TextEditingController registerConfirmPasswordController = TextEditingController();

  @override
  void dispose() {
    documentController.dispose();
    passwordController.dispose();
    registerEmailcontroller.dispose();
    registerDocumentcontroller.dispose();
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
    setToLoading();

    await Future.delayed(Duration(seconds: 5));

    setToLoaded();
  }
}