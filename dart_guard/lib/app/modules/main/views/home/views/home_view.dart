import 'package:dart_guard/app/modules/main/views/wrapper/wrapper_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('HOME'), TextButton(onPressed: context.read<WrapperViewmodel>().logOut, child: Text('Sair'))],
        ),
      ),
    );
  }
}
