import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_guard/app/core/firebase_initializer.dart';
import 'package:dart_guard/app/modules/main/repositories/user/user_repository.dart';
import 'package:dart_guard/app/shared/either/either.dart';
import 'package:dart_guard/app/shared/failures/auth_failures.dart';
import 'package:dart_guard/app/shared/failures/failure.dart';
import 'package:dart_guard/app/modules/main/models/user.dart';
import 'package:dart_guard/app/shared/failures/network_failures.dart';

class FirebaseUserRepository implements UserRepository {
  final _firebaseInitializer = FirebaseInitializer();

  @override
  Future<Either<Failure, User>> getUserByDocument(String document) async {
    final initializeEither = await _firebaseInitializer.initialize();
    if (initializeEither.isLeft) {
      return Either.left(initializeEither.left);
    }

    try {
      final usersCollection = FirebaseFirestore.instance.collection('users');
      QuerySnapshot querySnap = await usersCollection.where('document', isEqualTo: document).limit(1).get();

      if (querySnap.docs.isEmpty) {
        return Either.left(UserNotFoundFailure('Usuário não encontrado'));
      } else {
        User user = User.fromMap(querySnap.docs[0].data() as Map<String, dynamic>);
        return Either.right(user);
      }
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        return Either.left(NetworkFailure('Sem conexão com a internet'));
      } else {
        return Either.left(Failure('Firestore error: ${e.message}'));
      }
    }
  }

  @override
  Future<Either<Failure, User>> getUserByEmail(String email) async {
    final initializeEither = await _firebaseInitializer.initialize();
    if (initializeEither.isLeft) {
      return Either.left(initializeEither.left);
    }

    try {
      final usersCollection = FirebaseFirestore.instance.collection('users');
      QuerySnapshot querySnap = await usersCollection.where('email', isEqualTo: email).limit(1).get();

      if (querySnap.docs.isEmpty) {
        return Either.left(UserNotFoundFailure('Usuário não encontrado'));
      } else {
        User user = User.fromMap(querySnap.docs[0].data() as Map<String, dynamic>);
        return Either.right(user);
      }
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        return Either.left(NetworkFailure('Sem conexão com a internet'));
      } else {
        return Either.left(Failure('Firestore error: ${e.message}'));
      }
    }
  }

  @override
  Future<Either<Failure, String>> insert(User user) async {
    final initializeEither = await _firebaseInitializer.initialize();
    if (initializeEither.isLeft) {
      return Either.left(initializeEither.left);
    }

    try {
      final usersCollection = FirebaseFirestore.instance.collection('users');
      DocumentReference docRef = await usersCollection.add(user.toMap());
      DocumentSnapshot docSnap = await docRef.get();
      return Either.right(docSnap.id);
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        return Either.left(NetworkFailure('Sem conexão com a internet'));
      } else {
        return Either.left(Failure('Firestore error: ${e.message}'));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> update(User user) async {
    final initializeEither = await _firebaseInitializer.initialize();
    if (initializeEither.isLeft) {
      return Either.left(initializeEither.left);
    }

    try {
      final usersCollection = FirebaseFirestore.instance.collection('users');
      await usersCollection.doc(user.id).update(user.toMap());
      return Either.right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        return Either.left(NetworkFailure('Sem conexão com a internet'));
      } else {
        return Either.left(Failure('Firestore error: ${e.message}'));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> delete(String userId) async {
    final initializeEither = await _firebaseInitializer.initialize();
    if (initializeEither.isLeft) {
      return Either.left(initializeEither.left);
    }

    try {
      final usersCollection = FirebaseFirestore.instance.collection('users');
      await usersCollection.doc(userId).delete();
      return Either.right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        return Either.left(NetworkFailure('Sem conexão com a internet'));
      } else {
        return Either.left(Failure('Firestore error: ${e.message}'));
      }
    }
  }
}
