import 'package:fpdart/fpdart.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/value_object/value_failure.dart';
import 'package:mpos_beat/core/failures/value_object/value_validator.dart';
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
      (l) => throw CustomException(errMsg: 'Unexpected value at $T'),
      (r) => r,
    );
  }

  ValueFailure? get getFailure => value.fold((l) => l, (r) => null);

  T? get getValue => value.fold((l) => null, (value) => value);

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
      ConfirmPassword._(
        validateConfirmPassword(confirmValue, originalPassword),
      );

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

  factory CompanyName(String value) =>
      CompanyName._(validateCompanyName(value));

  const CompanyName._(this.value);
}

class Otp extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Otp(String value) => Otp._(validateOtp(value));

  const Otp._(this.value);
}

class UserName extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UserName(String value) => UserName._(validateUserName(value));

  const UserName._(this.value);
}

class WhatsAppNumber extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory WhatsAppNumber(String value) =>
      WhatsAppNumber._(validateWhatsAppNumber(value));

  const WhatsAppNumber._(this.value);
}

class Designation extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Designation(String value) =>
      Designation._(validateDesignation(value));

  const Designation._(this.value);
}

class ReportingTo extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ReportingTo(String value) =>
      ReportingTo._(validateReportingTo(value));

  const ReportingTo._(this.value);
}

class VehicleName extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory VehicleName(String value) =>
      VehicleName._(validateVehicleName(value));

  const VehicleName._(this.value);
}

class VehicleCode extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory VehicleCode(String value) =>
      VehicleCode._(validateVehicleCode(value));

  const VehicleCode._(this.value);
}

class RouteName extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RouteName(String value) => RouteName._(validateRouteName(value));

  const RouteName._(this.value);
}

class RouteCode extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RouteCode(String value) => RouteCode._(validateRouteCode(value));

  const RouteCode._(this.value);
}

class DisplayName extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DisplayName(String value) =>
      DisplayName._(validateDisplayName(value));

  const DisplayName._(this.value);
}

class Address1 extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Address1(String value) => Address1._(validateAddress1(value));

  const Address1._(this.value);
}

class Address2 extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Address2(String value) => Address2._(validateAddress2(value));

  const Address2._(this.value);
}

class Address3 extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Address3(String value) => Address3._(validateAddress3(value));

  const Address3._(this.value);
}

class Pincode extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Pincode(String value) => Pincode._(validatePinocde(value));

  const Pincode._(this.value);
}

class Country extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Country(String value) => Country._(validateCountry(value));

  const Country._(this.value);
}

class CountryState extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CountryState(String value) => CountryState._(validateState(value));

  const CountryState._(this.value);
}

class RegistrationType extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RegistrationType(String value) =>
      RegistrationType._(validateRegistrationType(value));

  const RegistrationType._(this.value);
}

class IntegrationSerialNo extends ValueObjet<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory IntegrationSerialNo(String value) =>
      IntegrationSerialNo._(validateRegistrationType(value));

  const IntegrationSerialNo._(this.value);
}
