import 'package:flutter/material.dart';
import 'package:flutter_auth/Config/color_config.dart';

class CategoryButton extends StatelessWidget {
  final String category;
  final bool clicked;

  const CategoryButton({
    Key key,
    this.category,
    this.clicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var clicked = this.clicked;
    return Container(
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: clicked ? Colors.cyan : ColorConfig.thirdColor,
        ),
        child: Text(
          this.category,
          style: TextStyle(
            color: Colors.black,
          ),
        ));
  }
}
