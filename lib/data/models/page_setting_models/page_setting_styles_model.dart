import 'package:flutter/material.dart';
import 'package:web_funnel/core/gen/strings.dart';

class PageSettingStylesModel {
  final String statusBar;
  final String backgroundImage;
  final bool blurImage;
  final Color backgroundColor;
  final bool autoNavigation;
  final int durationInSec;

  PageSettingStylesModel({
    required this.statusBar,
    required this.backgroundImage,
    required this.blurImage,
    required this.backgroundColor,
    required this.autoNavigation,
    required this.durationInSec,
  });

  PageSettingStylesModel.initial()
      : statusBar = '',
        backgroundImage = '',
        blurImage = false,
        backgroundColor = const Color(0xFFFFFFFF),
        autoNavigation = false,
        durationInSec = 0;

  @override
  String toString() {
    return 'PageSettingStylesModel(statusBar: $statusBar, backgroundImage: $backgroundImage, blurImage: $blurImage, backgroundColor: $backgroundColor, autoNavigation: $autoNavigation, durationInSec: $durationInSec)';
  }

  static List<String> themeStatusItems = [Strings.light, Strings.dark];

  static List<String> buttonTypeItems = [Strings.floating, Strings.pinned];
}
