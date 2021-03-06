import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/Models/status.dart';
import 'package:flutter_auth/Components/AlertComponent/status_alert.dart';

class AlertComponent {
  final BuildContext context;

  AlertComponent(this.context);

  void show(Status status) {
    if (status.status == "ERROR" || status.status == "ERROR.SERVER") {
      Future.delayed(
          Duration.zero, () async => StatusAlert(context).show(status));
    }
    if (status.status == "SUCCESS") {
      Future.delayed(
          Duration.zero, () async => StatusAlert(context).show(status));
    }
  }
}
