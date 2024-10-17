import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/components/number_input_component.dart';
import 'package:web_funnel/ui/models/images/image_components.dart';
import 'package:web_funnel/ui/models/paddings/padding_model.dart';
import 'package:web_funnel/ui/models/text/text_properties.dart';

class Paddings extends StatefulWidget {
  const Paddings({super.key});

  @override
  State<Paddings> createState() => _PaddingsState();
}

class _PaddingsState extends State<Paddings> {
  PaddingModel paddingModel =
      PaddingModel(right: '24', left: '24', top: '24', bottom: '24');
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(24.0),
      color: AppColors.sidebarBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.paddings,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          NumberInputComponent(
            text: Strings.top,
            onChanged: (p0) {
              paddingModel.top = p0;
            },
            maxLength: 3,
            padding: EdgeInsets.only(bottom: 8),
          ),
          NumberInputComponent(
            text: Strings.bottom,
            onChanged: (p0) {
              paddingModel.bottom = p0;
            },
            maxLength: 3,
            padding: EdgeInsets.only(bottom: 8),
          ),
          NumberInputComponent(
            text: Strings.left,
            maxLength: 3,
            onChanged: (p0) {
              paddingModel.left = p0;
            },
            padding: EdgeInsets.only(bottom: 8),
          ),
          NumberInputComponent(
            text: Strings.right,
            maxLength: 3,
            onChanged: (p0) {
              paddingModel.right = p0;
            },
            padding: EdgeInsets.only(bottom: 8),
          ),
          TextProperties(),
          // ImageComponents(),
        ],
      ),
    );
  }
}
