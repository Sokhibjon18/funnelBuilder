import 'package:flutter/material.dart';

class TextModel {
  String textFormat;
  String textWeight;
  String size;
  String align;
  Color color;

  TextModel({
    required this.color,
    required this.size,
    required this.align,
    required this.textFormat,
    required this.textWeight,
  });
}
