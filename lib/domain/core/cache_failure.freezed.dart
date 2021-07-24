// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'cache_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CacheFailureTearOff {
  const _$CacheFailureTearOff();

  NoCache noChache() {
    return const NoCache();
  }
}

/// @nodoc
const $CacheFailure = _$CacheFailureTearOff();

/// @nodoc
mixin _$CacheFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noChache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noChache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoCache value) noChache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoCache value)? noChache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheFailureCopyWith<$Res> {
  factory $CacheFailureCopyWith(
          CacheFailure value, $Res Function(CacheFailure) then) =
      _$CacheFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$CacheFailureCopyWithImpl<$Res> implements $CacheFailureCopyWith<$Res> {
  _$CacheFailureCopyWithImpl(this._value, this._then);

  final CacheFailure _value;
  // ignore: unused_field
  final $Res Function(CacheFailure) _then;
}

/// @nodoc
abstract class $NoCacheCopyWith<$Res> {
  factory $NoCacheCopyWith(NoCache value, $Res Function(NoCache) then) =
      _$NoCacheCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoCacheCopyWithImpl<$Res> extends _$CacheFailureCopyWithImpl<$Res>
    implements $NoCacheCopyWith<$Res> {
  _$NoCacheCopyWithImpl(NoCache _value, $Res Function(NoCache) _then)
      : super(_value, (v) => _then(v as NoCache));

  @override
  NoCache get _value => super._value as NoCache;
}

/// @nodoc

class _$NoCache implements NoCache {
  const _$NoCache();

  @override
  String toString() {
    return 'CacheFailure.noChache()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoCache);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noChache,
  }) {
    return noChache();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noChache,
    required TResult orElse(),
  }) {
    if (noChache != null) {
      return noChache();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoCache value) noChache,
  }) {
    return noChache(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoCache value)? noChache,
    required TResult orElse(),
  }) {
    if (noChache != null) {
      return noChache(this);
    }
    return orElse();
  }
}

abstract class NoCache implements CacheFailure {
  const factory NoCache() = _$NoCache;
}
