import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dart_guard/main.dart' as app;

import 'utils/login_test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Formulário vazio exibe erros de validação', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    await switchToRegisterTab(tester);

    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.text('Informe o nome'), findsOneWidget);
    expect(find.text('Informe o e-mail'), findsOneWidget);
    expect(find.text('Informe o CPF'), findsOneWidget);
    expect(find.text('Informe a senha'), findsOneWidget); 
  });

  testWidgets('CPF com menos de 11 dígitos mostra erro', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    await switchToRegisterTab(tester);

    await tester.enterText(find.byKey(Key('registerDocumentField')), '12345678');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.text('CPF inválido'), findsOneWidget);
  });

  testWidgets('E-mail inválido mostra erro', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    await switchToRegisterTab(tester);

    await tester.enterText(find.byKey(Key('registerEmailField')), 'usuario-sem-arroba');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.text('E-mail inválido'), findsOneWidget);
  });

  testWidgets('Senha curta mostra erro', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    await switchToRegisterTab(tester);

    await tester.enterText(find.byKey(Key('registerPasswordField')), '123');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.text('Senha deve ter pelo menos 6 caracteres'), findsOneWidget);
  });

  testWidgets('Senhas diferentes mostram erro de confirmação', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    await switchToRegisterTab(tester);

    await tester.enterText(find.byKey(Key('registerPasswordField')), '123456');
    await tester.enterText(find.byKey(Key('registerConfirmPasswordField')), 'diferente');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.text('Senhas não coincidem'), findsOneWidget);
  });
}
