import 'package:dartz/dartz.dart';

import '../core/cache_failure.dart';
import 'user.dart';
import 'value_objects.dart';


abstract class ILocalAuthRepository {
  /// Gets the cached [User].
  /// Throws [CacheException] if no cached data is present.
  Future<Either<CacheFailure, User>> getUserData();

  /// Caches user Email and Password in flutter's secure storage
  Future<void> cacheUserData(EmailAddress email, Password password);

  Future<void> deleteUserData();
}
