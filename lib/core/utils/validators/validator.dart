import 'package:injectable/injectable.dart';
import '../constants.dart';

@lazySingleton
class Validator {
  String? validateEmail(String input) {
    if (input.isEmpty) {
      return Constants.emailCannotBeEmpty;
    } else if (!RegExp(
      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(input)) {
      return Constants.enterValidEmail;
    }
    return null;
  }

  String? validatePassword(String input) {
    if (input.isEmpty) {
      return Constants.passwordCannotBeEmpty;
    } else if (!RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    ).hasMatch(input)) {
      return Constants.invalidPassword;
    }
    return null;
  }

  String? validateConfirmPassword(String input, String password) {
    if (input.isEmpty || input != password) {
      return Constants.confirmPasswordMustMatch;
    }
    return null;
  }

  String? validateName(String name) {
    if (name.isEmpty) {
      return Constants.nameCannotBeEmpty;
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)) {
      return Constants.invalidName;
    }
    return null;
  }
}
