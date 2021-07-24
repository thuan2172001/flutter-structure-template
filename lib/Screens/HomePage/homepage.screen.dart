import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/Header/home_header.dart';
import 'package:flutter_auth/Screens/HomePage/components/body.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HomeHeader(),
        automaticallyImplyLeading: false,
      ),
      body: Body(),
    );
  }
}