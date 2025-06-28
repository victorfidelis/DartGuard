import 'package:dart_guard/app/modules/main/models/user.dart';
import 'package:flutter/material.dart';


class WrapperViewmodel extends ChangeNotifier {
  User? user;
  bool get loggedInUser => user != null;

  void logIn(User user) {
    user = user;
    notifyListeners();
  }

  void logOut() {
    user = null;
    notifyListeners();
  }
}