import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(200),
      child: Image.asset('assets/images/person.png', fit: BoxFit.cover),
    );
  }
}
