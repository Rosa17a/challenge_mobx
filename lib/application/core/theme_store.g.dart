// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on ThemeStoreBase, Store {
  Computed<bool>? _$isDarkComputed;

  @override
  bool get isDark => (_$isDarkComputed ??=
          Computed<bool>(() => super.isDark, name: 'ThemeStoreBase.isDark'))
      .value;
  Computed<ThemeData>? _$lightThemeComputed;

  @override
  ThemeData get lightTheme =>
      (_$lightThemeComputed ??= Computed<ThemeData>(() => super.lightTheme,
              name: 'ThemeStoreBase.lightTheme'))
          .value;
  Computed<ThemeData>? _$darkThemeComputed;

  @override
  ThemeData get darkTheme =>
      (_$darkThemeComputed ??= Computed<ThemeData>(() => super.darkTheme,
              name: 'ThemeStoreBase.darkTheme'))
          .value;

  final _$themeDataAtom = Atom(name: 'ThemeStoreBase.themeData');

  @override
  ThemeData get themeData {
    _$themeDataAtom.reportRead();
    return super.themeData;
  }

  @override
  set themeData(ThemeData value) {
    _$themeDataAtom.reportWrite(value, super.themeData, () {
      super.themeData = value;
    });
  }

  final _$getThemeAsyncAction = AsyncAction('ThemeStoreBase.getTheme');

  @override
  Future<void> getTheme() {
    return _$getThemeAsyncAction.run(() => super.getTheme());
  }

  final _$toggleThemeAsyncAction = AsyncAction('ThemeStoreBase.toggleTheme');

  @override
  Future<void> toggleTheme() {
    return _$toggleThemeAsyncAction.run(() => super.toggleTheme());
  }

  @override
  String toString() {
    return '''
themeData: ${themeData},
isDark: ${isDark},
lightTheme: ${lightTheme},
darkTheme: ${darkTheme}
    ''';
  }
}
