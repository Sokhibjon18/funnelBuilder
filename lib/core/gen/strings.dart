import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_generator/easy_localization_generator.dart';

part 'strings.g.dart';

//https://docs.google.com/spreadsheets/d/1dOb4eFpZ46-JLuFaN5C5JWlRBsoVxIZRX8QjkacKSUg/edit?usp=sharing

@SheetLocalization(
  docId: '1dOb4eFpZ46-JLuFaN5C5JWlRBsoVxIZRX8QjkacKSUg',
  version: 9,
  outDir: 'assets/localization',
  outName: 'translations.csv',
  preservedKeywords: [
    'few',
    'many',
    'one',
    'other',
    'two',
    'zero',
    'male',
    'female',
  ],
)
class _Strings {}
