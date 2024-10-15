import 'dart:ui';

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

  @override
  String toString() {
    return 'PageSettingButtonModel(hasButton: $hasButton, buttonColor: $buttonColor, textColor: $textColor, type: $type, text: $text)';
  }
}
