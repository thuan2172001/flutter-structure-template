import 'dart:io';

import 'package:flutter_auth/Entities/app.dart';
import 'package:flutter_auth/Entities/location.dart';
import 'package:flutter_auth/Entities/storage.dart';
import 'package:flutter_auth/Services/Entity/time_service.dart';
import 'package:path_provider/path_provider.dart';

class StorageService {
  static initStorage() {
    Storage.appEntity = new AppEntity();
    Storage.listLanguage = [];
    Storage.location = new LocationEntity();
    Storage.location.latitude = 0.0;
    Storage.location.longitude = 0.0;
  }

  static Future<void> setDir() async {
    Storage.directory = await getTemporaryDirectory();
  }

  static Future<void> deleteDir() async {
    // Storage.directory = await getTemporaryDirectory();
    // if (Storage.directory.existsSync()) {
    //   Storage.directory.deleteSync(recursive: true);
    //   Storage.directory = await getTemporaryDirectory();
    // }
  }

  static String getDir() {
    return Storage.directory.path;
  }

  static File makeFile() {
    return new File(getDir() + "/" + TimeService.timeNowToString() + ".png");
  }

  static File makeFileThumbnail() {
    return new File(
        getDir() + "/" + TimeService.timeNowToString() + "_thumbnail.png");
  }

  static LocationEntity getLocation() {
    return Storage.location;
  }
}
