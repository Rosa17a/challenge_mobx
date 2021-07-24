import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_failure.freezed.dart';

@freezed
 class CacheFailure with _$CacheFailure {
  const factory CacheFailure.noChache() = NoCache;
}
