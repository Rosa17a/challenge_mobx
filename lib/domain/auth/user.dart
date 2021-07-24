import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/value_objects.dart';
import 'value_objects.dart';

part 'user.freezed.dart';

@freezed
 class User with _$User {
  const factory User({
    UniqueId? id,
    EmailAddress? emailAddress,
    Password? password,
  }) = _User;
}
