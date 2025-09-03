
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/value_object/value_failure.dart';
import 'package:mpos_beat/core/failures/value_object/value_validator.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ValueObjet<T> extends Equatable {
  const ValueObjet();

  Either<ValueFailure<String>, T> get value;

  bool isValid() => value.isRight();

  /// Throws [CustomException] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity same as writeing (right) => right
    return value.fold(
        (l) => throw CustomException(errMsg: 'Unexpected value at $T'), id);
  }

  ValueFailure? get getFailure => value.fold(id, (r) => null);

  T? get getValue => value.fold((l) => null, id);

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'Value($value)';
}

// class Mail extends ValueObjet<String> {
//   @override
//   final Either<ValueFailure<String>, String> value;

//   factory Mail(String value) => Mail._(validateMail(value));

//   const Mail._(this.value);

// }

class PhoneNumber extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PhoneNumber(String value) =>
      PhoneNumber._(validatePhoneNumber(value));

  const PhoneNumber._(this.value);
}

class EmailAddress extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String value) => EmailAddress._(validateEmail(value));

  const EmailAddress._(this.value);
}

class Password extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String value) => Password._(validatePassword(value));

  const Password._(this.value);
}

class ConfirmPassword extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  /// Pass both confirm password value and the original password
  factory ConfirmPassword(String confirmValue, String originalPassword) =>
      ConfirmPassword._(validateConfirmPassword(confirmValue, originalPassword));

  const ConfirmPassword._(this.value);
}

class EmailOrPhone extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailOrPhone(String input) {
    return EmailOrPhone._(validateEmailOrPhone(input));
  }

  const EmailOrPhone._(this.value);
}

class CompanyName extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CompanyName(String value) => CompanyName._(validateCompanyName(value));

  const CompanyName._(this.value);
}


