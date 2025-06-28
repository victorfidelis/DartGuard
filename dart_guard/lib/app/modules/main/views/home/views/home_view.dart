import 'package:dart_guard/app/modules/main/views/home/widgets/contract_section.dart';
import 'package:dart_guard/app/modules/main/views/home/widgets/contractors_section.dart';
import 'package:dart_guard/app/modules/main/views/home/widgets/my_family_section.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserCard(),
            SizedBox(height: 15),
            ContractSection(),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [MyFamilySection(), SizedBox(height: 15), ContractorsSection(), SizedBox(height: 15)],
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
