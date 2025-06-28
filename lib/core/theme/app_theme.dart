import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  //Primary-Colors
  static const Color primaryLight = Colors.white;
  static const Color primaryDark = Colors.black;
  static Color? primaryBlue = Colors.blue;
  static const Color primaryGrey = Colors.grey;

  //Outline-Colors
  static Color? lightOutlineColor = Colors.grey[300];
  static Color? darkOutlineColor = Colors.grey[500];

  //Text-Colors
  static const Color darkBgTextColor = Colors.white;
  static const Color lightBgTextColor = Colors.black;
  static const Color greyTextColor = Colors.grey;

  //Icon-Colors
  static const Color darkBgIconColor = Colors.white;
  static const Color lightBgIconColor = Colors.black;

  //Bg-Colors
  static Color? iconDarkBgColor = Colors.grey[300];
  static Color? iconLightBgColor = Colors.grey[500];
}