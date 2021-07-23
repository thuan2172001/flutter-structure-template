import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/Storage/language_storage_service.dart';
import 'package:flutter_auth/Services/Storage/storage_service.dart';
import 'package:flutter_auth/routes.dart';

// void main() => runApp(MyApp());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.initStorage();
  await LanguageStorageService.initLanguage();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RouteGenerater routeGenerater = new RouteGenerater();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: Color(0xFF37B4EE),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      onGenerateRoute: routeGenerater.routes,
    );
  }
}