import 'package:mpos_beat/core/failures/value_object/value_failure.dart';
import 'package:dartz/dartz.dart';

Either<ValueFailure<String>, String> validatePhoneNumber(String input) {
  if (input.isEmpty) {
    return left(const ValueFailure.invalidValue("Enter phone number"));
  }
  // final regex = RegExp(r'^[0-9]{10}$');
  // if (!regex.hasMatch(input)) {
  if (input.length <= 7) {
    return left(const ValueFailure.invalidValue("Enter a valid phone number"));
  }
  return right(input);
}

Either<ValueFailure<String>, String> validateEmail(String mail) {
  final RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  if (!emailRegExp.hasMatch(mail)) {
    return left(
      const ValueFailure.invalidValue('Enter a valid mail'),
    );
  } else if (mail.isEmpty) {
    return left(
      const ValueFailure.invalidValue('Enter a valid mail'),
    );
  }
  return right(mail);
}

Either<ValueFailure<String>, String> validatePassword(String value) {
  if (value.isEmpty || value.length < 3) {
    return left(
      const ValueFailure.invalidValue('Enter a valid password'),
    );
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateConfirmPassword(
    String confirmValue, String originalPassword) {
  if (confirmValue.isEmpty || confirmValue.length < 3) {
    return left(
      const ValueFailure.invalidValue('Enter a valid password'),
    );
  }
  if (confirmValue != originalPassword) {
    return left(
      const ValueFailure.invalidValue('Passwords do not match'),
    );
  }
  return right(confirmValue);
}

Either<ValueFailure<String>, String> validateEmailOrPhone(String value) {
  if (value.isEmpty) {
    return left(
      const ValueFailure.invalidValue('Please enter your username'),
    );
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateCompanyName(String value) {
  if (value.isEmpty) {
    return left(
      const ValueFailure.invalidValue('Enter a valid name'),
    );
  }
  return right(value);
}
