import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/Storage/language_storage_service.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(LanguageStorageService.text('LOGIN_SUCCESS_MSG')),
          ),
        ],
      ),
    );
  }
}
