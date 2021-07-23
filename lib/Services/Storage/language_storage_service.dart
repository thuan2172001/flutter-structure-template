import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Models/language.dart';
import 'package:flutter_auth/Models/storage.dart';

class LanguageStorageService {
  static Future<void> initLanguage() async {
    String fileJsonVi = await rootBundle.loadString("assets/languages/vi.json");
    String fileJsonEn = await rootBundle.loadString("assets/languages/en.json");
    Language languageVi = new Language();
    languageVi.subLanguage = "vi";
    languageVi.locale = Locale("vi", "VN");
    languageVi.languageName = "Tiếng Việt";
    languageVi.data = json.decode(fileJsonVi);
    languageVi.file = "assets/images/vi.png";
    Language languageEn = new Language();
    languageEn.subLanguage = "en";
    languageEn.locale = Locale("en", "US");
    languageEn.languageName = "English";
    languageEn.file = "assets/images/en.png";
    languageEn.data = json.decode(fileJsonEn);
    Storage.listLanguage.add(languageVi);
    Storage.listLanguage.add(languageEn);
    Storage.appEntity.language = languageVi;
  }

  static void changeLanguage({Language language}) {
    Storage.appEntity.language = language;
  }

  static Language stringToLanguage({String language}) {
    for (int i = 0; i < Storage.listLanguage.length; i++) {
      if (Storage.listLanguage[i].languageName == language) {
        return Storage.listLanguage[i];
      }
    }
    return null;
  }

  static Language getLanguage() {
    return Storage.appEntity.language;
  }

  static Locale getLocale() {
    return Storage.appEntity.language.locale;
  }

  static String text(String str) {
    if (Storage.appEntity?.language?.data[str] != null)
      return Storage.appEntity.language.data[str].toString();
    else
      return str;
  }
}
