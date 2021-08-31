import 'package:challenge/domain/core/i_localization_repository.dart';
import 'package:challenge/presentation/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = ThemeStoreBase with _$ThemeStore;

abstract class ThemeStoreBase with Store {
  final ILRepository _themeRepository;

  ThemeStoreBase(this._themeRepository);

  @computed
  bool get isDark => themeData == darkTheme;

  @observable
  ThemeData themeData = DefaultTheme.standard;

  @computed
  ThemeData get lightTheme => DefaultTheme.standard;

  @computed
  ThemeData get darkTheme => DefaultTheme.standardDark;

  @action
  Future<void> getTheme() async {
    themeData = await _getTheme();
  }

  @action
  Future<void> toggleTheme() async {
    themeData = await _toggleTheme(themeData);
  }

  Future<ThemeData> _getTheme() async {
    final themeKey = _themeRepository.getThemeKey();

    if (themeKey == null) {
      await _themeRepository.setThemeKey(lightTheme);

      return lightTheme;
    } else {
      return themeKey == "light" ? lightTheme : darkTheme;
    }
  }

  Future<ThemeData> _toggleTheme(ThemeData theme) async {
    if (theme == lightTheme) {
      theme = darkTheme;
    } else {
      theme = lightTheme;
    }

    await _themeRepository.setThemeKey(theme);
    return theme;
  }
}
