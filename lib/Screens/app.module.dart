import 'package:flutter_auth/Screens/HomePage/homepage.screen.dart';
import 'package:flutter_auth/Screens/Login/login.screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome.screen.dart';
import 'package:flutter_auth/Services/Utility/share-preferences-helper.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  static const String login = '/login';
  static const String home = '/homepage';
  static const String welcome  = '/welcome';

  @override
  final List<Bind> binds = [
    AsyncBind((i) => SharePreferencesHelper.getInstance()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      login,
      child: (_, __) => LoginScreen(),
    ),
    ChildRoute(
      home,
      child: (_, __) => HomePageScreen(),
    ),
    ChildRoute(
      welcome,
      child: (_, __) => WelcomeScreen(),
    ),
  ];
}