import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Services/Storage/language_storage_service.dart';
import 'package:flutter_auth/Services/Storage/storage_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'Screens/app.module.dart';
import 'Screens/app.screen.dart';

Future<void> main() async {
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]); //<--
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness:
      Brightness.dark,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.initStorage();
  await LanguageStorageService.initLanguage();

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
