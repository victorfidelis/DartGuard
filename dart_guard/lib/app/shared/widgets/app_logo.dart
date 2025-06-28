import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(200),child: Image.asset('assets/images/logo_dart.png'),),
        SizedBox(width: 12),
        Text('DartGuard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
