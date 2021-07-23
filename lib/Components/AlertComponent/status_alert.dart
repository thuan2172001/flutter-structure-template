import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/status.dart';
import 'package:flutter_auth/Services/Storage/language_storage_service.dart';

class StatusAlert {
  BuildContext context;

  StatusAlert(this.context);

  void show(Status status) {
    AlertDialog alert;
    if (status.status == "SUCCESS") {
      alert = AlertDialog(
        backgroundColor: Color(0xFFE3F2FD),
        title: Container(
          child: Text(
            LanguageStorageService.text(status.status),
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: "SVN-Gilroy"),
            textAlign: TextAlign.center,
          ),
        ),
        content: Container(
          child: Text(
            LanguageStorageService.text(status.message),
            style: TextStyle(
                color: Color(0xFF37B4EE),
                fontSize: 15,
                fontWeight: FontWeight.w300,
                fontFamily: "SVN-Gilroy"),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else if (status.status == "ERROR" || status.status == "ERROR.SERVER") {
      alert = AlertDialog(
        backgroundColor: Color(0xFFE3F2FD),
        title: Container(
          child: Text(
            LanguageStorageService.text(status.status),
            style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: "SVN-Gilroy"),
            textAlign: TextAlign.center,
          ),
        ),
        content: Container(
          child: Text(
            LanguageStorageService.text(status.message),
            style: TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.w300,
                fontFamily: "SVN-Gilroy"),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
