import 'package:dart_guard/app/modules/main/views/login/widgets/login_form.dart';
import 'package:dart_guard/app/modules/main/views/login/widgets/social_media_links.dart';
import 'package:dart_guard/app/shared/theme/theme_constants.dart';
import 'package:dart_guard/app/shared/widgets/app_logo.dart';
import 'package:flutter/foundation.dart';
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
                child: Container(
                  padding: EdgeInsets.only(left: 50, top: 80, right: 50),
                  decoration: BoxDecoration(gradient: ThemeConstants.defaultGradient),
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
          Positioned(
            left: 1,
            right: 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(left: 50, top: 80, right: 50),
                child: Column(
                  crossAxisAlignment: kIsWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 34, child: AppLogo()),
                    SizedBox(height: 20),
                    Text('Bem vindo!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                    SizedBox(height: 10),
                    Text(
                      'Aqui você gerencia seus seguros e de seus familiares em poucos cliques',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(left: 1, right: 1, bottom: 100, child: SocialMediaLinks()),
          LoginForm(),
        ],
      ),
    );
  }
}
