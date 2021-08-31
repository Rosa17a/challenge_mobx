import 'dart:ui';

import 'package:challenge/presentation/core/themes.dart';
import 'package:flutter/src/material/theme.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/core/i_localization_repository.dart';

const String LOCALE = "locale";
const String THEME = 'theme';

// @injectable
@LazySingleton(as: ILRepository)
class LRepository implements ILRepository {
  final SharedPreferences _sharedPreferences;

  LRepository(this._sharedPreferences);
  @override
  String? getLocaleKey() {
    return _sharedPreferences.getString(LOCALE);
  }

  @override
  Future<void> setLocaleKey(Locale locale) async {
    await _sharedPreferences.setString(
        LOCALE, locale.languageCode == 'en' ? 'en' : 'hy');
  }

  @override
  String? getThemeKey() {
    return _sharedPreferences.getString(THEME);
  }

  @override
  Future<void> setThemeKey(ThemeData theme) {
    return _sharedPreferences.setString(
      THEME,
      theme == DefaultTheme.standard ? "light" : "dark",
    );
  }
}
