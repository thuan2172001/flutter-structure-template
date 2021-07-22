import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/Entities/status.dart';

class AlertComponent {
  final BuildContext context;

  AlertComponent(this.context);

  void show(Status status) {
    if (status.status == "ERROR" || status.status == "ERROR.SERVER") {
      Future.delayed(
          Duration.zero, () async => print(status));
    }
    if (status.status == "SUCCESS") {
      Future.delayed(
          Duration.zero, () async => print(status));
    }
  }
}
