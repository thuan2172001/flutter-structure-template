import 'dart:io';

import 'package:flutter_auth/Models/language.dart';
import 'package:flutter_auth/Models/location.dart';
import 'package:flutter_auth/Models/user.dart';
import 'package:flutter_auth/Models/app.dart';

class Storage {
  static User user;
  static AppEntity appEntity;
  static List<Language> listLanguage;
  static Directory directory;
  static LocationEntity location;
}
