import 'package:flutter/material.dart';

class _StaticColors {
  static const transparent = Colors.transparent;
  static const nero = Color(0xFF1E1E1E);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const vividCerulean = Color(0xFF099EE2);
  static const blueWhale = Color(0xFF0C1324);
  static const shark = Color(0xFF343537);
  static const charcoal = Color(0xFF444444);
  static const cornflowerBlue = Color(0xFF657DE8);
  static const gainsboro = Color(0xFFE4E4E4);
}

class AppColors {
  // General Colors
  static const Color transparent = _StaticColors.transparent;
  static const Color window = _StaticColors.nero;
  static const Color black = _StaticColors.black;
  static const Color white = _StaticColors.white;

  // Text Colors
  static const Color textPrimary = _StaticColors.gainsboro;

  // Border Colors
  static const Color containerBorderPrimary = _StaticColors.black;
  static const Color switchBorder = _StaticColors.cornflowerBlue;

  // Background Colors
  static const Color sidebarBackground = _StaticColors.shark;
  static const Color componentsBackground = _StaticColors.charcoal;
  static const Color switchOnBackground = _StaticColors.cornflowerBlue;
  static Color backgroundWhite10 = _StaticColors.white.withOpacity(0.1);

  // Action Colors
  static const Color primaryIcon = _StaticColors.white;
  static const Color actionBlack = _StaticColors.black;
}
