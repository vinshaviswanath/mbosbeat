import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class MainFailure with _$MainFailure {
  const factory MainFailure.customError({
    required String errorMsg,
  }) = CustomError;

  const factory MainFailure.genericError({
    required String errorMsg,
  }) = GenericError;

      const factory MainFailure.invalidReferralCode({
    required String errorMsg,
  }) = InvalidReferralCode;
}