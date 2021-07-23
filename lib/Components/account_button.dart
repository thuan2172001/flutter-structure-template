import 'package:flutter/material.dart';
import 'package:flutter_auth/Config/color_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountButton extends StatelessWidget {
  const AccountButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        child: Container(
            padding: EdgeInsets.all(10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: ColorConfig.secondaryColor.withOpacity(0.1),
                shape: BoxShape.circle),
            child: SvgPicture.asset("assets/icons/User Icon.svg")),
        onTap: () {},
      ),
    );
  }
}
