import 'package:dio/dio.dart';
import 'package:flutter_auth/Services/Utility/custom_dio.dart';

class UserAPI {
  static Future getCredential(String userName) async {
    try {
      print(userName);
      Response response;
      CustomDio customDio = CustomDio();
      response = await customDio.post(
        "/auth/credential",
        {"username": userName, "_actionType": "POST_API-AUTH-PING"}
      );
      print(response);
      return response;
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }
}
