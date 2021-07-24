import 'package:dio/dio.dart';
import 'package:flutter_auth/Services/Utility/custom_dio.dart';

class EmailApi {
  static Future verifyMail(String username, String type) async {
    try {
      Response response;
      CustomDio customDio = new CustomDio();
      response = await customDio.post("/sendVerifyEmail", {
        "username": username,
        "type": type,
      });
      return response;
    } catch (e) {
      return null;
    }
  }
}
