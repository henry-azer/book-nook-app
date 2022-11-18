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

      default:
        return null;
    }
  }
}

String? _validateEmail(String value) {
  if (!_isValidEmail(value)) {
    return "invalid_email";
  } else if (value.trim() == "") {
    return "required";
  } else {
    return "";
  }
}

String? _validateSigninPassword(String value) {
  if (value.length < 8) {
    return "at_least_8_chars";
  } else if (value.trim() == "") {
    return "required";
  } else {
    return "";
  }
}

bool _isValidEmail(String value) {
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
}
