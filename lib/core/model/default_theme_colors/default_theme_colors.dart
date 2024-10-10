import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class StaticColors {
  static const transparent = Colors.transparent;
  static const nero = Color(0xFF1E1E1E);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const vividCerulean = Color(0xFF099EE2);
  static const blueWhale = Color(0xFF0C1324);
}

@singleton
class DefaultThemeColors {
  final transparent = StaticColors.transparent;
  final window = StaticColors.nero;
  final black = StaticColors.black;
  final white = StaticColors.white;
  final primary = StaticColors.black;
  final phoneBorder = StaticColors.black.withOpacity(0.2);
  final disable = StaticColors.vividCerulean.withOpacity(0.15);
  final header = StaticColors.blueWhale;
  final containerColor = StaticColors.black.withOpacity(0.2);
  final containerBorder = StaticColors.black;
}
