import 'package:dart_guard/app/shared/theme/theme_constants.dart';
import 'package:dart_guard/app/shared/widgets/custom_loading.dart';
import 'package:flutter/material.dart';

class LoginButtom extends StatelessWidget {
  final Function() onTap;
  final bool isLoading;

  const LoginButtom({super.key, required this.onTap, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Color(0xff2c2b3b),
            borderRadius: BorderRadius.circular(200),
            boxShadow: [BoxShadow(color: Color(0xff101010), offset: Offset(0, 6), spreadRadius: -2, blurRadius: 4)],
          ),
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              gradient: ThemeConstants.defaultGradient,
              borderRadius: BorderRadius.circular(200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [isLoading ? CustomLoading() : Icon(Icons.arrow_forward, size: 30)],
            ),
          ),
        ),
      ),
    );
  }
}
