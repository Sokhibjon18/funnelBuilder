import 'package:flutter/material.dart';

class _StaticColors {
  static const transparent = Colors.transparent;
  static const nero = Color(0xFF1E1E1E);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const vividCerulean = Color(0xFF099EE2);
  static const blueWhale = Color(0xFF0C1324);
}

class AppColors {
  static const Color transparent = _StaticColors.transparent;
  static const Color window = _StaticColors.nero;
  static const Color black = _StaticColors.black;
  static const Color white = _StaticColors.white;
  static const Color primary = _StaticColors.black;
  static Color phoneBorder = _StaticColors.black.withOpacity(0.2);
  static Color disable = _StaticColors.vividCerulean.withOpacity(0.15);
  static const Color header = _StaticColors.blueWhale;
  static Color containerColor = _StaticColors.black.withOpacity(0.2);
  static const Color containerBorder = _StaticColors.black;
}
