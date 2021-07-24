
import 'package:flutter_auth/Models/status.dart';

class SignupValidator {
  static Status checkPassword(String password, String confirmPassword) {
    if (password == confirmPassword)
      return new Status(status: "ERROR", message: "CONFIRM_PASSWORD_NOT_MATCH");
    else
      return new Status(status: "SUCCESS", message: "SUCCESS");
  }
}
