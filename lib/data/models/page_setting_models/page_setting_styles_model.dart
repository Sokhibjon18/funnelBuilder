import 'package:flutter/material.dart';
import 'package:web_funnel/core/gen/strings.dart';

class PageSettingStylesModel {
  final String statusBarValue;
  final String backgroundImage;
  final bool blurImage;
  final Color backgroundColor;
  final bool autoNavigation;
  final int durationInSec;

  PageSettingStylesModel({
    required this.statusBarValue,
    required this.backgroundImage,
    required this.blurImage,
    required this.backgroundColor,
    required this.autoNavigation,
    required this.durationInSec,
  });

  PageSettingStylesModel.initial()
      : statusBarValue = themeStatusItems[1],
        backgroundImage = '',
        blurImage = false,
        backgroundColor = const Color(0xFFFFFFFF),
        autoNavigation = false,
        durationInSec = 0;

  PageSettingStylesModel copyWith({
    String? statusBarValue,
    String? backgroundImage,
    bool? blurImage,
    Color? backgroundColor,
    bool? autoNavigation,
    int? durationInSec,
  }) {
    return PageSettingStylesModel(
      statusBarValue: statusBarValue ?? this.statusBarValue,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      blurImage: blurImage ?? this.blurImage,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      autoNavigation: autoNavigation ?? this.autoNavigation,
      durationInSec: durationInSec ?? this.durationInSec,
    );
  }

  @override
  String toString() {
    return 'PageSettingStylesModel(statusBar: $statusBarValue, backgroundImage: $backgroundImage, blurImage: $blurImage, backgroundColor: $backgroundColor, autoNavigation: $autoNavigation, durationInSec: $durationInSec)';
  }

  static List<String> themeStatusItems = [Strings.light, Strings.dark];

  static List<String> buttonTypeItems = [Strings.floating, Strings.pinned];
}
