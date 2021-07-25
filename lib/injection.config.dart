// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import 'application/auth/auth_module.dart' as _i7;
import 'domain/auth/i_auth_facade.dart' as _i4;
import 'domain/core/i_localization_repository.dart' as _i8;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i5;
import 'infrastructure/auth/firebase_injectable_module.dart' as _i10;
import 'infrastructure/core/local_storage_injectable._module.dart' as _i11;
import 'infrastructure/core/localization_repository.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final localStorageStorageInjectableModule =
      _$LocalStorageStorageInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.IAuthFacade>(
      () => _i5.FirebaseAuthFacade(get<_i3.FirebaseAuth>()));
  await gh.factoryAsync<_i6.SharedPreferences>(
      () => localStorageStorageInjectableModule.prefs,
      preResolve: true);
  gh.factory<_i7.AuthModule>(() => _i7.AuthModule(get<_i4.IAuthFacade>()));
  gh.lazySingleton<_i8.ILRepository>(
      () => _i9.LRepository(get<_i6.SharedPreferences>()));
  return get;
}

class _$FirebaseInjectableModule extends _i10.FirebaseInjectableModule {}

class _$LocalStorageStorageInjectableModule
    extends _i11.LocalStorageStorageInjectableModule {}
