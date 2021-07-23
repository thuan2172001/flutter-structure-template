import 'package:flutter/material.dart';
import 'package:flutter_auth/Config/color_config.dart';
import 'package:flutter_auth/Config/font_config.dart';

class CustomThemeData {
  CustomThemeData._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: FontConfig.mainFont,
    primarySwatch: ColorConfig.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    )),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    accentColor: ColorConfig.darkColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(ColorConfig.darkColor),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(ColorConfig.darkColor),
      trackColor: MaterialStateProperty.all<Color>(ColorConfig.darkColor),
    ),
  );
}
