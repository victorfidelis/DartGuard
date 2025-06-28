import 'package:dart_guard/app/core/firebase_initializer.dart';
import 'package:dart_guard/app/modules/main/repositories/auth/auth_repository.dart';
import 'package:dart_guard/app/shared/either/either.dart';
import 'package:dart_guard/app/shared/failures/auth_failures.dart';
import 'package:dart_guard/app/shared/failures/failure.dart';
import 'package:dart_guard/app/shared/failures/network_failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository implements AuthRepository {
  final _firebaseInitializer = FirebaseInitializer();

  @override
  Future<Either<Failure, Unit>> signInEmailPassword({required String email, required String password}) async {
    final initializeEither = await _firebaseInitializer.initialize();
    if (initializeEither.isLeft) {
      return Either.left(initializeEither.left);
    }

    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return Either.right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        return Either.left(NetworkFailure('Sem conexão com a internet'));
      } else if (e.code == 'invalid-credential') {
        return Either.left(InvalidCredentialFailure('Credenciais de usuário inválidas'));
      } else if (e.code == 'too-many-requests') {
        return Either.left(TooManyRequestsFailure('Bloqueio temporário. Muitas tentativas incorretas'));
      } else {
        return Either.left(Failure('Firestore error: ${e.message}'));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> createUserEmailPassword({required String email, required String password}) async {
    final initializeEither = await _firebaseInitializer.initialize();
    if (initializeEither.isLeft) {
      return Either.left(initializeEither.left);
    }

    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return Either.right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        return Either.left(NetworkFailure('Sem conexão com a internet'));
      } else if (e.code == 'email-already-in-use') {
        return Either.left(EmailAlreadyInUseFailure('Email já cadastrado'));
      } else {
        return Either.left(Failure('Firestore error: ${e.message}'));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> sendPasswordResetEmail({required String email}) async {
    final initializeEither = await _firebaseInitializer.initialize();
    if (initializeEither.isLeft) {
      return Either.left(initializeEither.left);
    }

    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return Either.right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        return Either.left(NetworkFailure('Sem conexão com a internet'));
      } else {
        return Either.left(Failure('Firestore error: ${e.message}'));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    final initializeEither = await _firebaseInitializer.initialize();
    if (initializeEither.isLeft) {
      return Either.left(initializeEither.left);
    }

    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.signOut();
      return Either.right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        return Either.left(NetworkFailure('Sem conexão com a internet'));
      } else {
        return Either.left(Failure('Firestore error: ${e.message}'));
      }
    }
  }
}
