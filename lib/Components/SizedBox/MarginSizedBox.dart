
import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/Config/color_config.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 1,
      child: Container(
        color: ColorConfig.primaryColor,
      ),
    );
  }
}