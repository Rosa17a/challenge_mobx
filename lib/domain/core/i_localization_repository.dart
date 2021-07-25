import 'package:flutter/material.dart';

abstract class ILRepository {
  String? getLocalKey();
  Future<void> setLocalKey(Locale locale);
}
