import 'package:dio/dio.dart';
import 'package:flutter_auth/Services/Api/certificate_service.dart';
import 'package:flutter_auth/Services/Utility/custom_dio.dart';

class UserAPI {
  static Future getCredential(String username) async {
    try {
      Response response;
      CustomDio customDio = CustomDio();
      response = await customDio.post("/auth/credential", {
        "username": username,
        "_actionType": "POST_API-AUTH-PING",
      });
      return response;
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }

  static Future signup(String username, String password) async {
    try {
      Map<String, dynamic> keyPair 	= generateKeyPairAndEncrypt(password);
      Response response;
      CustomDio customDio = CustomDio();
      response = await customDio.post("/user", {
        "publicKey": keyPair["publicKey"],
        "encryptedPrivateKey": keyPair["encryptedPrivateKey"],
        "displayName": username,
        "username": username,
      });
      return response;
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }
}
