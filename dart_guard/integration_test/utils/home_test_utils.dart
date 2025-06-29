import 'package:flutter_test/flutter_test.dart';

Future<void> verifyHomeLoaded(WidgetTester tester) async {
  expect(find.text('Bem vindo!'), findsOneWidget);
  expect(find.text('Victor'), findsOneWidget);

  expect(find.text('Cotar e Contratar'), findsOneWidget);
  expect(find.text('Automóvel'), findsOneWidget);
  expect(find.text('Residência'), findsOneWidget);
  expect(find.text('Vida'), findsOneWidget);
  expect(find.text('Acidentes Pessoais'), findsOneWidget);

  expect(find.text('Minha Família'), findsOneWidget);
  expect(find.text('Adicione aqui membros da sua família e compartilhe os segudoros com eles.'), findsOneWidget);

  expect(find.text('Contratados'), findsOneWidget);
  expect(find.text('Você ainda não possui seguros contratados.'), findsOneWidget);
}

Future<void> verifyMenuLoaded(WidgetTester tester) async {
  expect(find.text('Home / Seguros'), findsOneWidget);
  expect(find.text('Minhas Contratações'), findsOneWidget);
  expect(find.text('Meus Sinistros'), findsOneWidget);
  expect(find.text('Minha Família'), findsAny);
  expect(find.text('Meus Bens'), findsOneWidget);
  expect(find.text('Pagamentos'), findsOneWidget);
  expect(find.text('Coberturas'), findsOneWidget);
  expect(find.text('Validar Boleto'), findsOneWidget);
  expect(find.text('Telefones Importantes'), findsOneWidget);
  expect(find.text('Configurações'), findsOneWidget);
  expect(find.text('Sair'), findsOneWidget);
}
