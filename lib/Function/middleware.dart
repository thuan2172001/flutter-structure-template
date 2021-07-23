import 'package:flutter/material.dart';
// import 'package:flutter_auth/Api/user_api.dart';
// import 'package:flutter_auth/Entities/status.dart';
// import 'package:flutter_auth/Entities/storage.dart';
// import 'package:flutter_auth/Validator/response_validator.dart';

class MiddleWare {
  static Future<void> push(BuildContext context, String route,
      {arguments}) async {
    // if (Storage.user == null) return false;
    // Response responseAuth = await UserAPI.getCredential(Storage.user.username);
    // Status responseAuthValidator =
    //     ResponseValidator.checkAuth(responseAuth, Storage.user.id);
    // if (responseAuthValidator.status != "OK")
    //   ServerErrorAlert(context).show(responseAuthValidator);
    // else
    Navigator.of(context).pushNamed(route, arguments: arguments);
  }

  static Future<void> pushAndReplace(BuildContext context, String route,
      {arguments}) async {
    // if (Storage.user == null) return false;
    // Response responseAuth = await UserAPI.getCredential(Storage.user.username);
    // Status responseAuthValidator =
    //     ResponseValidator.checkAuth(responseAuth, Storage.user.id);
    // if (responseAuthValidator.status != "OK")
    //   print('Server Error Alert');
    //   // ServerErrorAlert(context).show(responseAuthValidator);
    // else
    Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
  }

  static Future<void> pop(BuildContext context) async {
    // if (Storage.user == null) return false;
    // Response responseAuth = await UserAPI.getCredential(Storage.user.username);
    // Status responseAuthValidator =
    //     ResponseValidator.checkAuth(responseAuth, Storage.user.id);
    // if (responseAuthValidator.status != "OK")
    //   ServerErrorAlert(context).show(responseAuthValidator);
    // else
    Navigator.of(context).pop();
  }

  static Future<void> popAndReplace(BuildContext context, String route,
      {arguments}) async {
    // if (Storage.user == null) return false;
    // Response responseAuth = await UserAPI.getCredential(Storage.user.username);
    // Status responseAuthValidator =
    //     ResponseValidator.checkAuth(responseAuth, Storage.user.id);
    // if (responseAuthValidator.status != "OK")
    //   ServerErrorAlert(context).show(responseAuthValidator);
    // else {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
  }

  static Future<void> pushAndClearRoute(BuildContext context, String route,
      {arguments}) async {
    // if (Storage.user == null) return false;
    // Response responseAuth = await UserAPI.getCredential(Storage.user.username);
    // Status responseAuthValidator =
    //     ResponseValidator.checkAuth(responseAuth, Storage.user.id);
    // if (responseAuthValidator.status != "OK")
    //   ServerErrorAlert(context).show(responseAuthValidator);
    // else {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }
}