import 'package:book_nook_app/core/validation/validation_types.dart';

class ValidateTextFiled {
  final String value;
  final String label;

  ValidateTextFiled({required this.value, required this.label});

  static String? validate(String? value, label) {
    switch (label) {
      case (ValidationTypes.signinEmail):
        {
          return _validateEmail(value!);
        }
      case (ValidationTypes.signinPassword):
        {
          return _validateSigninPassword(value!);
        }
      case (ValidationTypes.signupFirstName):
        {
          return _validateSignupFirstName(value!);
        }
      case (ValidationTypes.signupLastName):
        {
          return _validateSignupLastName(value!);
        }
      case (ValidationTypes.signupPhoneNumber):
      {
        return _validateSignupPhoneNumber(value!);
      }
      case (ValidationTypes.signupDayBirtday):
        {
          return _validateSignupDayBirthday(value!);
        }
      case (ValidationTypes.signupMonthBirtday):
        {
          return _validateSignupMonthBirthday(value!);
        }
      case (ValidationTypes.signupYearBirtday):
        {
          return _validateSignupYearBirthday(value!);
        }
      default:
        return null;
    }
  }
}

String? _validateEmail(String value) {
  if (value.trim() == "") {
    return "required";
  } else if (!_isValidEmail(value)) {
    return "invalid_email";
  } else {
    return "";
  }
}

String? _validateSigninPassword(String value) {
  if (value.trim() == "") {
    return "required";
  } else if (value.length < 8) {
    return "at_least_8_chars";
  } else {
    return "";
  }
}

String? _validateSignupFirstName(String value) {
  if (value.trim() == "" || value.isEmpty) {
    return "required";
  } else if (value.length < 2) {
    return "at_least_3_chars";
  } else {
    return "";
  }
}

String? _validateSignupLastName(String value) {
  if (value.trim() == ""|| value.isEmpty) {
    return "required";
  } else if (value.length < 2) {
    return "at_least_3_chars";
  } else {
    return "";
  }
}

String? _validateSignupPhoneNumber(String value) {
  if (value.trim() == ""|| value.isEmpty) {
    return "required";
  } else if (value.length < 10) {
    return "at_least_11_chars";
  } else {
    return "";
  }
}

String? _validateSignupDayBirthday(String value) {
  if (value.trim() == ""|| value.isEmpty) {
    return "required";
  } else if (value.length > 31 ) {
    return "at_least_31_Day";
  } else {
    return "";
  }
}

String? _validateSignupMonthBirthday(String value) {
  if (value.trim() == ""|| value.isEmpty) {
    return "required";
  } else if (value.length > 12 ) {
    return "at_least_12_Month";
  } else {
    return "";
  }
}

String? _validateSignupYearBirthday(String value) {
  if (value.trim() == ""|| value.isEmpty) {
    return "required";
  } else {
    return "";
  }
}

bool _isValidEmail(String value) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
}
