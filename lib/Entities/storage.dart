import 'dart:io';

import 'package:flutter_auth/Entities/language.dart';
import 'package:flutter_auth/Entities/location.dart';
import 'package:flutter_auth/Entities/user.dart';
import 'package:flutter_auth/Entities/app.dart';

class Storage {
  static User user;
  static AppEntity appEntity;
  static List<Language> listLanguage;
  static Directory directory;
  static LocationEntity location;
}
