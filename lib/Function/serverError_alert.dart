import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/status.dart';
import 'package:flutter_auth/Services/Storage/language_storage_service.dart';
import 'package:flutter_auth/Services/Storage/user_storage_service.dart';

class ServerErrorAlert {
  final BuildContext context;

  ServerErrorAlert(this.context);

  Future<void> show(Status status) async {
    // set up the AlertDialog
    AlertDialog alert;
    alert = AlertDialog(
      backgroundColor: Colors.white10,
      title: Text(LanguageStorageService.text(status.status)),
      content: Text(
        LanguageStorageService.text(status.message),
        style: TextStyle(color: Colors.red),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Thử lại'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text('Thoát'),
          onPressed: () async {
            UserStorageService.removeUser();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          },
        )
      ],
    );

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
