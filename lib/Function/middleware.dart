import 'package:flutter/material.dart';

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
    //   ServerErrorAlert(context).show(responseAuthValidator);
    // else
    print(route);
    print(context);
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
