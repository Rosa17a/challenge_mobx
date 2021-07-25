import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/core/i_localization_repository.dart';

const String LOCALE = "locale";

// @injectable
@LazySingleton(as: ILRepository)
class LRepository implements ILRepository {
  final SharedPreferences _sharedPreferences;

  LRepository(this._sharedPreferences);
  @override
  String? getLocalKey() {
    return _sharedPreferences.getString(LOCALE);
  }

  @override
  Future<void> setLocalKey(Locale locale) async {
    await _sharedPreferences.setString(
        LOCALE, locale.languageCode == 'en' ? 'en' : 'hy');
  }
}
