
import 'package:flutter_auth/Entities/status.dart';

class LoginValidator {
  static Status checkPassword(String privateKey) {
    if (privateKey == null)
      return new Status(status: "ERROR", message: "WRONG.PASSWORD");
    else
      return new Status(status: "SUCCESS", message: "SUCCESS");
  }
}
