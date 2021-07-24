// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_module.dart' as _i9;
import 'domain/auth/i_auth_facade.dart' as _i5;
import 'domain/auth/i_auth_local_repository.dart' as _i7;
import 'infrastructure/auth/auth_local_repository.dart' as _i8;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i6;
import 'infrastructure/auth/firebase_injectable_module.dart' as _i10;
import 'infrastructure/auth/secure_storage_injectabel.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final secureStorageInjectableModule = _$SecureStorageInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FlutterSecureStorage>(
      () => secureStorageInjectableModule.storage);
  gh.lazySingleton<_i5.IAuthFacade>(
      () => _i6.FirebaseAuthFacade(get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i7.ILocalAuthRepository>(
      () => _i8.AuthLocalRepository(get<_i4.FlutterSecureStorage>()));
  gh.factory<_i9.AuthModule>(() =>
      _i9.AuthModule(get<_i5.IAuthFacade>(), get<_i7.ILocalAuthRepository>()));
  return get;
}

class _$FirebaseInjectableModule extends _i10.FirebaseInjectableModule {}

class _$SecureStorageInjectableModule
    extends _i11.SecureStorageInjectableModule {}
