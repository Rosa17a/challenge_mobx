import 'package:dartz/dartz.dart';

import 'auth_failure.dart';
import 'user.dart';
import 'value_objects.dart';

abstract class IAuthFacade {
  /// [getSignedInUser] function tries to get signed in user
  /// from calling local or remote server. See implementations.
  /// Function returns option of `User`։
  Future<Option<User>> getSignedInUser();

  /// [registerWithEmailAndPassword] function tries to register user
  /// with inputed `email` and `password`.
  /// Function gets:
  /// * `EmailAddress` email,
  /// * `Password` password.
  ///
  /// Function returns either `AuthFailure` or nothing.
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  /// [registerWithEmailAndPassword] function tries to signin user
  /// with inputed `email` and `password`.
  /// Function gets:
  /// * `EmailAddress` email,
  /// * `Password` password.
  ///
  /// Function returns either `AuthFailure` or nothing.
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  /// [signOut] function signes out the signed in user.
  Future<void> signOut();
}
