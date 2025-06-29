import 'package:dart_guard/app/modules/main/models/user.dart';
import 'package:dart_guard/app/modules/main/services/login/login_service.dart';
import 'package:dart_guard/app/modules/main/views/login/viewmodel/login_viewmodel.dart';
import 'package:dart_guard/app/shared/either/either.dart';
import 'package:dart_guard/app/shared/failures/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginService extends Mock implements LoginService {}

void main() {
  late MockLoginService mockLoginService;
  late LoginViewmodel viewmodel;
  late bool loginCallbackCalled;
  late User callbackUser;

  setUpAll(() {
    registerFallbackValue(User(id: '', name: '', email: '', document: '', profilePicture: ''));
  });

  setUp(() {
    mockLoginService = MockLoginService();
    loginCallbackCalled = false;
    viewmodel = LoginViewmodel(
      loginService: mockLoginService,
      onSuccessfulLogin: (user) {
        loginCallbackCalled = true;
        callbackUser = user;
      },
    );
  });

  group('doLogin', () {
    test('deve validar campos vazios e não chamar o service', () async {
      viewmodel.documentController.text = '';
      viewmodel.passwordController.text = '';

      await viewmodel.doLogin();

      expect(viewmodel.errorDocument, 'Informe o CPF');
      expect(viewmodel.errorPassword, 'Informe a senha');
      verifyNever(() => mockLoginService.signIn(document: any(named: 'document'), password: any(named: 'password')));
    });

    test('deve mostrar erro de senha curta', () async {
      viewmodel.documentController.text = '12345678901';
      viewmodel.passwordController.text = '123';

      await viewmodel.doLogin();

      expect(viewmodel.errorPassword, 'Senha muito curta');
      verifyNever(() => mockLoginService.signIn(document: any(named: 'document'), password: any(named: 'password')));
    });

    test('deve chamar loginService.signIn e executar callback em sucesso', () async {
      final user = User(id: '1', name: 'Teste', email: 't@t.com', document: '12345678901', profilePicture: '');
      viewmodel.documentController.text = '12345678901';
      viewmodel.passwordController.text = '123456';

      when(
        () => mockLoginService.signIn(document: '12345678901', password: '123456'),
      ).thenAnswer((_) async => Either.right(user));

      await viewmodel.doLogin();

      expect(loginCallbackCalled, true);
      expect(callbackUser, user);
      expect(viewmodel.loginError, isNull);
      expect(viewmodel.isLoading, false);
    });

    test('deve exibir erro se login falhar', () async {
      viewmodel.documentController.text = '12345678901';
      viewmodel.passwordController.text = '123456';

      when(
        () => mockLoginService.signIn(document: '12345678901', password: '123456'),
      ).thenAnswer((_) async => Either.left(Failure('Erro de login')));

      await viewmodel.doLogin();

      expect(viewmodel.loginError, 'Erro de login');
      expect(loginCallbackCalled, false);
    });
  });

  group('doRegister', () {
    test('deve validar campos obrigatórios e não chamar o service', () async {
      viewmodel.registerNameController.text = '';
      viewmodel.registerEmailController.text = '';
      viewmodel.registerDocumentController.text = '';
      viewmodel.registerPasswordController.text = '';
      viewmodel.registerConfirmPasswordController.text = '';

      await viewmodel.doRegister();

      expect(viewmodel.errorRegisterName, 'Informe o nome');
      expect(viewmodel.errorRegisterEmail, 'Informe o e-mail');
      expect(viewmodel.errorRegisterDocument, 'Informe o CPF');
      expect(viewmodel.errorRegisterPassword, 'Informe a senha');

      verifyNever(() => mockLoginService.registerUser(user: any(named: 'user'), password: any(named: 'password')));
    });

    test('deve exibir erro se as senhas não coincidirem', () async {
      viewmodel.registerNameController.text = 'Victor nome';
      viewmodel.registerEmailController.text = 'victor_novo@email.com';
      viewmodel.registerDocumentController.text = '12345678901';
      viewmodel.registerPasswordController.text = '123456';
      viewmodel.registerConfirmPasswordController.text = 'abcdef';

      await viewmodel.doRegister();

      expect(viewmodel.errorRegisterConfirmPassword, 'Senhas não coincidem');

      verifyNever(() => mockLoginService.registerUser(user: any(named: 'user'), password: any(named: 'password')));
    });

    test('deve chamar loginService.registerUser e mudar para modo login se sucesso', () async {
      viewmodel.registerNameController.text = 'Victor nome';
      viewmodel.registerEmailController.text = 'victor_novo@email.com';
      viewmodel.registerDocumentController.text = '12345678901';
      viewmodel.registerPasswordController.text = '123456';
      viewmodel.registerConfirmPasswordController.text = '123456';

      when(
        () => mockLoginService.registerUser(user: any(named: 'user'), password: any(named: 'password')),
      ).thenAnswer((_) async => Either.right(unit));

      expect(viewmodel.inLoginMode, true);

      viewmodel.setToRegisterMode();
      expect(viewmodel.inRegisterMode, true);

      await viewmodel.doRegister();

      expect(viewmodel.inLoginMode, true);
      expect(viewmodel.registerError, isNull);
    });

    test('deve exibir erro se loginService.registerUser falhar', () async {
      viewmodel.registerNameController.text = 'Victor nome';
      viewmodel.registerEmailController.text = 'victor_novo@email.com';
      viewmodel.registerDocumentController.text = '12345678901';
      viewmodel.registerPasswordController.text = '123456';
      viewmodel.registerConfirmPasswordController.text = '123456';

      when(
        () => mockLoginService.registerUser(user: any(named: 'user'), password: any(named: 'password')),
      ).thenAnswer((_) async => Either.left(Failure('Erro ao registrar')));

      await viewmodel.doRegister();

      expect(viewmodel.registerError, 'Erro ao registrar');
    });
  });
}
