import 'dart:io';

import 'package:flutter_auth/Entities/language.dart';
import 'package:flutter_auth/Entities/location.dart';
import 'package:flutter_auth/Entities/user.dart';

class Storage {
  static User user;
  static List<Language> listLanguage;
  static Directory directory;
  static LocationEntity location;
}
