import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dart_guard/main.dart' as app;

import 'utils/login_test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login com usuário inexistente', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    await doLogin(tester, '00000000000', '123456');

    expect(find.text('Usuário não encontrado'), findsOneWidget);
    expect(find.byKey(Key('loginForm')), findsOneWidget);
  });

  testWidgets('Login com senha incorreta', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    await doLogin(tester, '12345678901', 'senhaErrada');

    expect(find.text('Credenciais de usuário inválidas'), findsOneWidget);
    expect(find.byKey(Key('loginForm')), findsOneWidget);
  });

  testWidgets('Login com campos vazios', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.text('Informe o CPF'), findsOneWidget);
    expect(find.text('Informe a senha'), findsOneWidget);
  });
}
