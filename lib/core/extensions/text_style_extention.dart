import 'package:flutter/material.dart';

extension TextStyleColorExtension on TextStyle {
  TextStyle c(Color color) => copyWith(color: color);

  TextStyle w(int fontWeight) {
    final weight = FontWeight.values[fontWeight ~/ 100 - 1];
    return copyWith(fontWeight: weight);
  }

  TextStyle s(double size) => copyWith(fontSize: size);
}
