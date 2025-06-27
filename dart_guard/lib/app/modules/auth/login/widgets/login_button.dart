import 'package:flutter/material.dart';

class LoginButtom extends StatelessWidget {
  final Function() onTap;

  const LoginButtom({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xff2c2b3b),
            borderRadius: BorderRadius.circular(200),
            boxShadow: [BoxShadow(color: Color(0xff101010), offset: Offset(0, 6), spreadRadius: -2, blurRadius: 4)],
          ),
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(200),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.arrow_forward, size: 30)]),
          ),
        ),
      ),
    );
  }
}
