import 'package:dart_guard/app/modules/main/views/home/widgets/contract_section.dart';
import 'package:dart_guard/app/modules/main/views/home/widgets/user_card.dart';
import 'package:dart_guard/app/modules/main/views/wrapper/wrapper_viewmodel.dart';
import 'package:dart_guard/app/shared/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(height: 26, child: const AppLogo()),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: [IconButton(icon: const Icon(Icons.notifications), onPressed: () {})],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserCard(),
          SizedBox(height: 15),
          ContractSection(),
          SizedBox(height: 15),
          SizedBox(height: 100),
          TextButton(onPressed: context.read<WrapperViewmodel>().logOut, child: Text('Sair')),
        ],
      ),
    );
  }
}
