import 'package:dart_guard/app/modules/main/views/home/widgets/contract_section.dart';
import 'package:dart_guard/app/modules/main/views/home/widgets/contractors_section.dart';
import 'package:dart_guard/app/modules/main/views/home/widgets/menu_drawer.dart';
import 'package:dart_guard/app/modules/main/views/home/widgets/my_family_section.dart';
import 'package:dart_guard/app/modules/main/views/home/widgets/user_card.dart';
import 'package:dart_guard/app/shared/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(height: 26, child: const AppLogo()),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer());
          },
        ),
        actions: [IconButton(icon: const Icon(Icons.notifications), onPressed: () {})],
      ),
      drawer: MenuDrawer(),
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
