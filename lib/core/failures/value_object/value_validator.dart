import 'package:fpdart/fpdart.dart';
import 'package:mpos_beat/core/failures/value_object/value_failure.dart';
import 'package:mpos_beat/core/utils/imports.dart';

Either<ValueFailure<String>, String> validatePhoneNumber(String input) {
  if (input.isEmpty) {
    return left(const ValueFailure.invalidValue("Enter phone number!"));
  }
  // final regex = RegExp(r'^[0-9]{10}$');
  // if (!regex.hasMatch(input)) {
  if (input.length <= 7) {
    return left(const ValueFailure.invalidValue("Enter a valid phone number!"));
  }
  return right(input);
}

Either<ValueFailure<String>, String> validateEmail(String mail) {
  Logger.logInfo(mail);
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (!emailRegExp.hasMatch(mail)) {
    return left(const ValueFailure.invalidValue('Enter a valid mail!'));
  } else if (mail.isEmpty) {
    return left(const ValueFailure.invalidValue('Enter a valid mail!'));
  }
  return right(mail);
}

// Either<ValueFailure<String>, String> validatePassword(String value) {
//   if (value.isEmpty || value.length < 3) {
//     return left(const ValueFailure.invalidValue('Enter a valid password!'));
//   }
//   return right(value);
// }

Either<ValueFailure<String>, String> validatePassword(String value) {
  if (value.isEmpty || value.length < 3) {
    return left(
      const ValueFailure.invalidValue(
        'Password must be at least 3 characters!',
      ),
    );
  }

  // Must contain at least one alphabet
  final hasAlphabet = RegExp(r'[a-zA-Z]').hasMatch(value);
  if (!hasAlphabet) {
    return left(
      const ValueFailure.invalidValue(
        'Password must contain at least one alphabet!',
      ),
    );
  }

  // Allow only alphabets, numbers, and allowed symbols (no emojis/invalid chars)
  final allowedRegExp = RegExp(
    r"^[a-zA-Z0-9!@#\$%^&*(),.?':{}|<>_\-+=~`\[\]\\;\/]+$",
  );
  if (!allowedRegExp.hasMatch(value)) {
    return left(
      const ValueFailure.invalidValue('Password contains invalid characters!'),
    );
  }

  return right(value.trim());
}

Either<ValueFailure<String>, String> validateConfirmPassword(
  String confirmValue,
  String originalPassword,
) {
  if (confirmValue.isEmpty || confirmValue.length < 3) {
    return left(const ValueFailure.invalidValue('Enter a valid password!'));
  }
  if (confirmValue != originalPassword) {
    return left(const ValueFailure.invalidValue('Passwords do not match!'));
  }
  return right(confirmValue);
}

Either<ValueFailure<String>, String> validateEmailOrPhone(String value) {
  if (value.isEmpty) {
    return left(
      const ValueFailure.invalidValue(
        'Please enter your Email ID / Mobile Number!',
      ),
    );
  }

  if (validateEmail(value).isRight()) {
    return right(value);
  }

  if (validatePhoneNumber(value).isRight()) {
    return right(value);
  }

  return left(const ValueFailure.invalidValue('Invalid email or phonenumber!'));
}

Either<ValueFailure<String>, String> validateCompanyName(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue('Enter a valid name!'));
  }

  // Allow only alphabets, numbers, and spaces
  final nameRegExp = RegExp(r'^[a-zA-Z0-9\s]+$');
  if (!nameRegExp.hasMatch(value)) {
    return left(
      const ValueFailure.invalidValue(
        'Name must contain only alphabets and numbers!',
      ),
    );
  }

  // Disallow only-numbers
  final onlyNumbers = RegExp(r'^\d+$');
  if (onlyNumbers.hasMatch(value)) {
    return left(
      const ValueFailure.invalidValue('Name cannot be only numbers!'),
    );
  }

  return right(value.trim());
}

Either<ValueFailure<String>, String> validateOtp(String value) {
  if (value.length < 4) {
    return left(const ValueFailure.invalidValue('Enter a valid otp!'));
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateUserName(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue('Enter a valid name!'));
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateWhatsAppNumber(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue("Enter phone number!"));
  }
  // final regex = RegExp(r'^[0-9]{10}$');
  // if (!regex.hasMatch(input)) {
  if (value.length <= 7) {
    return left(const ValueFailure.invalidValue("Enter a valid phone number!"));
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateDesignation(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue('Select a valid name!'));
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateReportingTo(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue('Selet a valid name!'));
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateVehicleName(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue('Select a valid name!'));
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateVehicleCode(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue('Select a valid code!'));
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateRouteName(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue('Select a valid name!'));
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateRouteCode(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue('Select a valid code!'));
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateDisplayName(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue('Select a valid Displayname!'));
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateAddress(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue('Select a valid Address!'));
  }
  return right(value);
}
//

Either<ValueFailure<String>, String> validatePinocde(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue('Select a valid Pincode!'));
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateCountry(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue('Select a valid Country!'));
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateState(String value) {
  if (value.isEmpty) {
    return left(const ValueFailure.invalidValue('Select a valid State!'));
  }
  return right(value);
}

Either<ValueFailure<String>, String> validateRegistrationType(String value) {
  if (value.isEmpty) {
    return left(
      const ValueFailure.invalidValue('Select a valid RegistrationType!'),
    );
  }
  return right(value);
}
