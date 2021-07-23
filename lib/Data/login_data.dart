import 'package:flutter_auth/Models/user.dart';

class LoginData {
  static User getUser(var data) {
    User user = new User();
    user.id = data['_id'];
    user.username = data['username'];
    user.email = data['email'];
    user.fullName = data['fullName'];
    user.code = data['code'];
    user.role = data['role']['name'];
    return user;
  }
}
