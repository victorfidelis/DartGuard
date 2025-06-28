import 'package:dart_guard/app/modules/main/views/home/home_view.dart';
import 'package:dart_guard/app/modules/main/views/login/login_view.dart';
import 'package:dart_guard/app/modules/main/views/wrapper/viewmodel/wrapper_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WrapperView extends StatelessWidget {
  const WrapperView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WrapperViewmodel>(
      builder: (context, state, _) {
        if (state.loggedInUser) {
          return const HomeView();
        } else {
          return const LoginView();
        }
      },
    );
  }
}
