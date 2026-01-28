import 'package:qr_pay_app/src/core/server/exceptions/network_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = _Success<T>;
  const factory Result.failure(NetworkException error) = _Failure<T>;
}
