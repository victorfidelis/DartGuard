import 'package:dart_guard/app/modules/main/models/login_storage.dart';
import 'package:dart_guard/app/modules/main/repositories/login_storage/login_storage_repository.dart';
import 'package:dart_guard/app/shared/either/either.dart';
import 'package:dart_guard/app/shared/failures/failure.dart';
import 'package:dart_guard/app/shared/failures/login_storage_faillure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLoginStorageRepository implements LoginStorageRepository {
  static const _keyDocument = 'loginDocument';
  static const _keyPassword = 'loginDassword';

  @override
  Future<Either<Failure, Unit>> saveCredentials(LoginStorage loginStorage) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyDocument, loginStorage.document);
      await prefs.setString(_keyPassword, loginStorage.password);
      return Either.right(unit);
    } catch (e) {
      return Either.left(Failure('Ocorreu uma falha ao salvar as credencias localmente'));
    }
  }

  @override
  Future<Either<Failure, LoginStorage>> getSavedCredentials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final document = prefs.getString(_keyDocument);
      final password = prefs.getString(_keyPassword);

      if (document == null || password == null) {
        return Either.left(LoginStorageFoundFailure('Login credenciais não encontradas.'));
      }
      return Either.right(LoginStorage(document: document, password: password));
    } catch (e) {
      return Either.left(Failure('Ocorreu uma falha ao consultar as credencias localmente'));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearCredentials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_keyDocument);
      await prefs.remove(_keyPassword);
      return Either.right(unit);
    } catch (e) {
      return Either.left(Failure('Ocorreu uma falha ao limpar as credencias localmente'));
    }
  }
}
