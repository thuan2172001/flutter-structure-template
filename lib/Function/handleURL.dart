import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/Container/web_view_container.dart';

class NewsLink {
  static handleURL(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }
}