import 'package:dart_guard/app/modules/main/views/home/widgets/user_image.dart';
import 'package:dart_guard/app/modules/main/views/wrapper/wrapper_viewmodel.dart';
import 'package:dart_guard/app/shared/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(gradient: ThemeConstants.defaultGradient),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
            child: UserImage(),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bem vindo!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text(
                context.read<WrapperViewmodel>().user!.name,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
