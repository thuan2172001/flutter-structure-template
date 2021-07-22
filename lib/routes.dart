import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/Navigation/tab_component.dart';
import 'package:flutter_auth/Screens/HomePage/homepage_screen.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';

class RouteGenerater {
  Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return TabComponent(widget: WelcomeScreen());
      case "/homepage":
        return TabComponent(widget: HomePageScreen());
      case "/login":
        return TabComponent(widget: LoginScreen());
      default:
        return TabComponent(widget: WelcomeScreen());
    }
  }
}
