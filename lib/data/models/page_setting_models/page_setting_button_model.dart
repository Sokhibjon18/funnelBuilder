import 'dart:ui';

import 'package:web_funnel/core/gen/strings.dart';

class PageSettingButtonModel {
  final bool hasButton;
  final Color buttonColor;
  final Color textColor;
  final String type;
  final String text;

  PageSettingButtonModel({
    required this.hasButton,
    required this.buttonColor,
    required this.textColor,
    required this.type,
    required this.text,
  });

  PageSettingButtonModel.initial()
      : hasButton = false,
        buttonColor = const Color(0xFF0000FF),
        textColor = const Color(0xFFFFFFFF),
        type = Strings.floating,
        text = '';

  PageSettingButtonModel copyWith({
    bool? hasButton,
    Color? buttonColor,
    Color? textColor,
    String? type,
    String? text,
  }) {
    return PageSettingButtonModel(
      hasButton: hasButton ?? this.hasButton,
      buttonColor: buttonColor ?? this.buttonColor,
      textColor: textColor ?? this.textColor,
      type: type ?? this.type,
      text: text ?? this.text,
    );
  }

  @override
  String toString() {
    return 'PageSettingButtonModel(hasButton: $hasButton, buttonColor: $buttonColor, textColor: $textColor, type: $type, text: $text)';
  }
}
