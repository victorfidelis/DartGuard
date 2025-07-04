
import 'package:dart_guard/app/shared/either/either.dart';
import 'package:dart_guard/app/shared/failures/failure.dart';
import 'package:dart_guard/app/shared/failures/network_failures.dart';
import 'package:dart_guard/app/core/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseInitializer {
  bool _isInitialized = false;

  static final FirebaseInitializer _instance = FirebaseInitializer._internal();
  FirebaseInitializer._internal();
  factory FirebaseInitializer() {
    return _instance;
  }

  Future<Either<Failure, Unit>> initialize() async {
    if (_isInitialized) {
      return Either.right(unit);
    }

    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _isInitialized = true;
      return Either.right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed') {
        return Either.left(NetworkFailure('Sem conexão com a internet'));
      } else {
        return Either.left(Failure('Firebase error: ${e.message}'));
      }
    }
  }
}