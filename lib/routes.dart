import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/Navigation/tab_component.dart';
import 'package:flutter_auth/Screens/HomePage/homepage.screen.dart';
import 'package:flutter_auth/Screens/Login/login.screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome.screen.dart';

import 'Screens/Account/account.screen.dart';

class RouteGenerater {
  Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return TabComponent(widget: WelcomeScreen());
      case "/homepage":
        return TabComponent(widget: HomePageScreen());
      case "/login":
        return TabComponent(widget: LoginScreen());
      case "/account":
        return TabComponent(widget: AccountScreen());
      default:
        return TabComponent(widget: WelcomeScreen());
    }
  }
}