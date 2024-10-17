import 'dart:ui';

import 'package:web_funnel/core/gen/strings.dart';

class PageSettingButtonModel {
  final bool hasButton;
  final Color buttonColor;
  final Color textColor;
  final String type;
  final String buttonText;

  PageSettingButtonModel({
    required this.hasButton,
    required this.buttonColor,
    required this.textColor,
    required this.type,
    required this.buttonText,
  });

  PageSettingButtonModel.initial()
      : hasButton = false,
        buttonColor = const Color(0xFF0000FF),
        textColor = const Color(0xFFFFFFFF),
        type = Strings.floating,
        buttonText = 'Continue';

  PageSettingButtonModel copyWith({
    bool? hasButton,
    Color? buttonColor,
    Color? textColor,
    String? type,
    String? buttonText,
  }) {
    return PageSettingButtonModel(
      hasButton: hasButton ?? this.hasButton,
      buttonColor: buttonColor ?? this.buttonColor,
      textColor: textColor ?? this.textColor,
      type: type ?? this.type,
      buttonText: buttonText ?? this.buttonText,
    );
  }

  @override
  String toString() {
    return 'PageSettingButtonModel(hasButton: $hasButton, buttonColor: $buttonColor, textColor: $textColor, type: $type, text: $buttonText)';
  }
}
