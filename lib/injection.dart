import 'package:challenge/application/core/theme_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application/core/locale_store.dart';
import 'infrastructure/core/localization_repository.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor: AppColors.white, statusBarBrightness: Brightness.dark));
  await Firebase.initializeApp();
  //TODO done this manually, because there were some issues with Injectable
  await registerLocalStore();
  $initGetIt(getIt, environment: env);
}

Future<void> registerLocalStore() async {
  final sharedPreferances = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<LocaleStore>(
      () => LocaleStore(LRepository(sharedPreferances)));
  getIt.registerLazySingleton<ThemeStore>(
      () => ThemeStore(LRepository(sharedPreferances)));
}
