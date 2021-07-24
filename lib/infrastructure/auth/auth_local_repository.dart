import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/i_auth_local_repository.dart';
import '../../domain/auth/user.dart';
import '../../domain/auth/value_objects.dart';
import '../../domain/core/cache_failure.dart';

const EMAIL_KEY = 'email';
const PASSWORD_KEY = 'password';

@LazySingleton(as: ILocalAuthRepository)

class AuthLocalRepository implements ILocalAuthRepository {
  final FlutterSecureStorage _secureStorage;

  AuthLocalRepository(this._secureStorage);

  @override
  Future<Either<CacheFailure, User>> getUserData() async {
    final email = await _secureStorage.read(key: EMAIL_KEY);
    final password = await _secureStorage.read(key: PASSWORD_KEY);

    if (email != null && password != null) {
      return Right(
        User(
          emailAddress: EmailAddress(email),
          password: Password(password),
        ),
      );
    } else {
      return const Left(CacheFailure.noChache());
    }
  }

  @override
  Future<void> deleteUserData() async {
    // Delete user data from the storage
    await _secureStorage.deleteAll();
  }

  @override
  Future<void> cacheUserData(EmailAddress email, Password password) async {
    // Write user email and password
    await Future.wait([
      _secureStorage.write(
        key: EMAIL_KEY,
        value: email.getOrCrash(),
      ),
      _secureStorage.write(
        key: PASSWORD_KEY,
        value: password.getOrCrash(),
      ),
    ]);
  }
}
