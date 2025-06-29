import 'package:dart_guard/app/modules/main/models/user.dart';
import 'package:dart_guard/app/modules/main/views/wrapper/viewmodel/wrapper_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late WrapperViewmodel viewmodel;

  setUp(() {
    viewmodel = WrapperViewmodel();
  });

  group('WrapperViewmodel', () {
    test('deve começar sem usuário logado', () {
      expect(viewmodel.user, isNull);
      expect(viewmodel.loggedInUser, isFalse);
    });

    test('deve logar um usuário', () {
      final user = User(id: '1', name: 'Victor', email: 'victor@test.com', document: '12345678901', profilePicture: '');

      viewmodel.logIn(user);

      expect(viewmodel.user, equals(user));
      expect(viewmodel.loggedInUser, isTrue);
    });

    test('deve deslogar o usuário', () {
      final user = User(id: '1', name: 'Victor', email: 'victor@test.com', document: '12345678901', profilePicture: '');

      viewmodel.logIn(user); 
      viewmodel.logOut(); 

      expect(viewmodel.user, isNull);
      expect(viewmodel.loggedInUser, isFalse);
    });
  });
}
