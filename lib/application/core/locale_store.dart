import 'dart:ui';

import 'package:mobx/mobx.dart';

import '../../domain/core/i_localization_repository.dart';

part 'locale_store.g.dart';

// @injectable
// @singleton
class LocaleStore = LocaleStoreBase with _$LocaleStore;

abstract class LocaleStoreBase with Store {
  final ILRepository _localeRepository;

  LocaleStoreBase(this._localeRepository);

  /// Getter for English language locale
  @computed
  Locale get en => const Locale('en');

  /// Getter for Armenian language locale
  @computed
  Locale get hy => const Locale('hy');

  @computed
  bool get isHY => locale == hy;

  @observable
  Locale locale = const Locale('hy');

  @action
  Future<void> getLocale() async {
    locale = await _getLocale();
  }

  @action
  Future<void> toggleLocale() async {
    locale = await _toggleLocale(locale);
  }

  Future<Locale> _toggleLocale(Locale locale) async {
    Locale _locale = locale;
    if (locale == en) {
      _locale = hy;
    } else {
      _locale = en;
    }

    await _localeRepository.setLocaleKey(_locale);
    return _locale;
  }

  Future<Locale> _getLocale() async {
    final String? localeKey = _localeRepository.getLocaleKey();
    if (localeKey == null) {
      await _localeRepository.setLocaleKey(en);

      return en;
    } else {
      return localeKey == "en" ? en : hy;
    }
  }
}
