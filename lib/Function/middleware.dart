import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_auth/Api/user_api.dart';
// import 'package:flutter_auth/Entities/status.dart';
// import 'package:flutter_auth/Entities/storage.dart';
// import 'package:flutter_auth/Validator/response_validator.dart';

class MiddleWare {
  static Future<void> push(String route,
      {arguments}) async {
    // if (Storage.user == null) return false;
    // Response responseAuth = await UserAPI.getCredential(Storage.user.username);
    // Status responseAuthValidator =
    //     ResponseValidator.checkAuth(responseAuth, Storage.user.id);
    // if (responseAuthValidator.status != "OK")
    //   ServerErrorAlert(context).show(responseAuthValidator);
    // else
    Modular.to.pushNamed(route, arguments: arguments);
  }

  static Future<void> pushAndReplace(String route,
      {arguments}) async {
    // if (Storage.user == null) return false;
    // Response responseAuth = await UserAPI.getCredential(Storage.user.username);
    // Status responseAuthValidator =
    //     ResponseValidator.checkAuth(responseAuth, Storage.user.id);
    // if (responseAuthValidator.status != "OK")
    //   print('Server Error Alert');
    //   // ServerErrorAlert(context).show(responseAuthValidator);
    // else
    Modular.to.pushReplacementNamed(route, arguments: arguments);
  }

  static Future<void> pop() async {
    // if (Storage.user == null) return false;
    // Response responseAuth = await UserAPI.getCredential(Storage.user.username);
    // Status responseAuthValidator =
    //     ResponseValidator.checkAuth(responseAuth, Storage.user.id);
    // if (responseAuthValidator.status != "OK")
    //   ServerErrorAlert(context).show(responseAuthValidator);
    // else
    Modular.to.pop();
  }

  static Future<void> popAndReplace(String route,
      {arguments}) async {
    // if (Storage.user == null) return false;
    // Response responseAuth = await UserAPI.getCredential(Storage.user.username);
    // Status responseAuthValidator =
    //     ResponseValidator.checkAuth(responseAuth, Storage.user.id);
    // if (responseAuthValidator.status != "OK")
    //   ServerErrorAlert(context).show(responseAuthValidator);
    // else {
    Modular.to.pop();
    Modular.to.pushReplacementNamed(route, arguments: arguments);
  }

  static Future<void> pushAndClearRoute(String route,
      {arguments}) async {
    // if (Storage.user == null) return false;
    // Response responseAuth = await UserAPI.getCredential(Storage.user.username);
    // Status responseAuthValidator =
    //     ResponseValidator.checkAuth(responseAuth, Storage.user.id);
    // if (responseAuthValidator.status != "OK")
    //   ServerErrorAlert(context).show(responseAuthValidator);
    // else {
    Modular.to.pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }
}
