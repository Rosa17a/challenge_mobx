import 'package:flutter/material.dart';

abstract class ILRepository {
  String? getLocaleKey();
  Future<void> setLocaleKey(Locale locale);
  String? getThemeKey();
  Future<void> setThemeKey(ThemeData theme);
}
