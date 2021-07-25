// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocaleStore on LocaleStoreBase, Store {
  Computed<Locale>? _$enComputed;

  @override
  Locale get en => (_$enComputed ??=
          Computed<Locale>(() => super.en, name: 'LocaleStoreBase.en'))
      .value;
  Computed<Locale>? _$hyComputed;

  @override
  Locale get hy => (_$hyComputed ??=
          Computed<Locale>(() => super.hy, name: 'LocaleStoreBase.hy'))
      .value;
  Computed<bool>? _$isHYComputed;

  @override
  bool get isHY => (_$isHYComputed ??=
          Computed<bool>(() => super.isHY, name: 'LocaleStoreBase.isHY'))
      .value;

  final _$localeAtom = Atom(name: 'LocaleStoreBase.locale');

  @override
  Locale get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(Locale value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  final _$getLocaleAsyncAction = AsyncAction('LocaleStoreBase.getLocale');

  @override
  Future<void> getLocale() {
    return _$getLocaleAsyncAction.run(() => super.getLocale());
  }

  final _$toggleLocaleAsyncAction = AsyncAction('LocaleStoreBase.toggleLocale');

  @override
  Future<void> toggleLocale() {
    return _$toggleLocaleAsyncAction.run(() => super.toggleLocale());
  }

  @override
  String toString() {
    return '''
locale: ${locale},
en: ${en},
hy: ${hy},
isHY: ${isHY}
    ''';
  }
}
