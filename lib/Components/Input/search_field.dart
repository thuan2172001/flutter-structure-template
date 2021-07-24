import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Config/color_config.dart';

class SearchField extends StatelessWidget {
  const SearchField();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      decoration: BoxDecoration(
          color: ColorConfig.secondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          suffixIcon: Icon(Icons.search),
          contentPadding:
              EdgeInsets.only(top: 10, left: 15, bottom: 5, right: 5),
        ),
        style: TextStyle(
          fontSize: 20,
          height: 1.3,
        ),
      ),
    );
  }
}
