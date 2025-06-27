import 'package:dart_guard/app/core/app_route.dart';
import 'package:dart_guard/app/core/providers.dart';
import 'package:dart_guard/app/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: MaterialTheme().dark(),
        initialRoute: '/wrapper',
        onGenerateRoute: appRoute,
      ),
    );
  }
}