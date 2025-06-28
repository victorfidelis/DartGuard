import 'package:dart_guard/app/modules/main/views/login/widgets/login_form.dart';
import 'package:dart_guard/app/modules/main/views/login/widgets/social_media_links.dart';
import 'package:dart_guard/app/shared/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(left: 50, top: 130, right: 50),
                  decoration: BoxDecoration(gradient: ThemeConstants.defaultGradient),
                  child: Column(
                    children: [
                      Row(children: [Text('Bem vindo!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900))]),
                      SizedBox(height: 10),
                      Text(
                        'Aqui você gerencia seus seguros e de seus familiares em poucos cliques',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Expanded(child: SocialMediaLinks()),
            ],
          ),
          LoginForm(),
        ],
      ),
    ); 
  }
}
