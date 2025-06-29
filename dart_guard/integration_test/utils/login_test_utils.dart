import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> verifyLoginLoaded(WidgetTester tester) async {
  expect(find.byKey(Key('loginForm')), findsOneWidget);
  expect(find.byKey(Key('documentField')), findsOneWidget);
  expect(find.byKey(Key('passwordField')), findsOneWidget);
}

Future<void> verifyRegisterLoaded(WidgetTester tester) async {
  expect(find.byKey(Key('loginForm')), findsOneWidget);
  expect(find.byKey(Key('registerNameField')), findsOneWidget);
  expect(find.byKey(Key('registerEmailField')), findsOneWidget);
  expect(find.byKey(Key('registerDocumentField')), findsOneWidget);
  expect(find.byKey(Key('registerPasswordField')), findsOneWidget);
  expect(find.byKey(Key('registerConfirmPasswordField')), findsOneWidget);
}

Future<void> doLogin(WidgetTester tester, String document, String password) async {
  await tester.enterText(find.byKey(Key('documentField')), document);
  await tester.enterText(find.byKey(Key('passwordField')), password);
  await tester.tap(find.byKey(Key('loginButton')));
  await tester.pumpAndSettle();
}

Future<void> switchToRegisterTab(WidgetTester tester) async {
  await tester.tap(find.text('Cadastrar'));
  await tester.pumpAndSettle();
}

Future<void> switchToLoginTab(WidgetTester tester) async {
  await tester.tap(find.text('Entrar'));
  await tester.pumpAndSettle();
}
