import 'package:dio/dio.dart';
import 'package:flutter_auth/Services/Utility/custom_dio.dart';

class LoginApi {
  static Future getPing(String certificate, String certificateFinal) async {
    try {
      Response response;
      CustomDio customDio = new CustomDio();
      customDio.dio.options.headers["Authorization"] = certificate;
      response = await customDio.post(
        "/auth/ping",
        certificateFinal,
      );
      return response;
    } catch (e) {
      return null;
    }
  }
}
