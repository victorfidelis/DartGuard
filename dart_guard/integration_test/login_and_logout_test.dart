import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dart_guard/main.dart' as app;

import 'utils/home_test_utils.dart';
import 'utils/login_test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login e logout', (tester) async {
    app.main();

    await tester.pumpAndSettle();

    await verifyLoginLoaded(tester);
    await doLogin(tester, '12345678901', '123456');
    await tester.pumpAndSettle();

    await verifyHomeLoaded(tester);
    await tester.tap(find.byKey(Key('menuButton')));
    await tester.pumpAndSettle();

    await verifyMenuLoaded(tester);
    await tester.tap(find.byKey(Key('logOutButton')));
    await tester.pumpAndSettle();

    await verifyLoginLoaded(tester);
  });
}
