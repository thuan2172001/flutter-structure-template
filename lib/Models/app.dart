import 'package:flutter_auth/Models/language.dart';

class AppEntity {
  String theme = "white";
  double fontSize = 50;
  Language language = new Language();

  Map<String, dynamic> toMap() {
    return {
      'language': language.subLanguage,
      'fontSize': fontSize,
      'theme': theme.toString(),
    };
  }
}
