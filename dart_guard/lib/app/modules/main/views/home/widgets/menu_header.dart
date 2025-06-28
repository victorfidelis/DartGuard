import 'package:dart_guard/app/modules/main/views/home/widgets/user_image.dart';
import 'package:dart_guard/app/modules/main/views/wrapper/viewmodel/wrapper_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SizedBox()),
          Text('Olá!', style: TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(
            height: 90,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
                  child: Stack(
                    children: [
                      UserImage(),
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0),
                        child: Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.read<WrapperViewmodel>().user!.name,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    Row(
                      children: [
                        Text(
                          'Minha conta',
                          style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.primary),
                        ),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
