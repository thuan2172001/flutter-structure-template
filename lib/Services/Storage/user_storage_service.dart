import 'package:flutter_auth/Entities/storage.dart';
import 'package:flutter_auth/Entities/user.dart';

class UserStorageService {
  static bool checkUser() {
    if (Storage.user != null) {
      return true;
    }
    return false;
  }

  static void removeUser() {
    Storage.user = null;
  }

  static void setUser(User user) {
    Storage.user = user;
  }

  static User getUser() {
    return Storage.user;
  }

  static String getUserBy(String type) {
    if (type == "id") return Storage.user.id;
    if (type == "username") return Storage.user.username;
    if (type == "publicKey") return Storage.user.publicKey;
    if (type == "role") return Storage.user.role;
    if (type == "code") return Storage.user.code;
    if (type == "privateKey") return Storage.user.privateKey;
    if (type == "fullName") return Storage.user.fullName;
    if (type == "certification") return Storage.user.certification;
    if (type == "email") return Storage.user.email;
    if (type == "encryptedPrivateKey") return Storage.user.encryptedPrivateKey;
    else
      return null;
  }
}
