import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/components/color_picker_component.dart';
import 'package:web_funnel/core/ui/components/number_input_component.dart';
import 'package:web_funnel/core/ui/widgets/common_textfield.dart';
import 'package:web_funnel/ui/models/text/text_model.dart';
import 'package:web_funnel/ui/models/text/widgets/custom_dropdawn.dart';

class TextProperties extends StatefulWidget {
  const TextProperties({super.key});

  @override
  State<TextProperties> createState() => _TextPropertiesState();
}

class _TextPropertiesState extends State<TextProperties> {
  String selectedTextFormat = 'first';
  String selectedTextWeight = 'first';
  String selectedPositioned = 'center';

  TextModel textModel = TextModel(
      color: AppColors.white,
      size: '16',
      align: 'center',
      textFormat: 'textFormat',
      textWeight: 'textWeight');

  List<String> textFormats = ['first', 'second', 'third'];
  List<String> textWeights = ['first', 'second', 'third'];
  List<String> positions = ['first', 'second', 'third'];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.text,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        CustomDropDawn(
          items: textFormats,
          selectedItem: selectedTextFormat,
          width: double.infinity,
          onChanged: (value) {
            setState(() {
              selectedTextFormat = value;
              textModel.textFormat = value;
              log(textModel.textFormat);
            });
          },
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomDropDawn(
                  width: 150,
                  selectedItem: selectedTextWeight,
                  onChanged: (value) {
                    setState(() {
                      selectedTextWeight = value;
                      textModel.textWeight = value;
                    });
                  },
                  items: textWeights),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 1,
              child: CommonTextfield(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 3,
                radius: 12,
                onChanged: (p0) {
                  textModel.size = p0;
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomDropDawn(
                  width: 150,
                  selectedItem: selectedTextWeight,
                  onChanged: (value) {
                    setState(() {
                      selectedTextWeight = value;
                      textModel.textWeight = value;
                    });
                  },
                  items: textWeights),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: ColorPickerComponent(text: Strings.color),
            ),
          ],
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.componentsBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              CommonTextfield(
                hint: 'Measure Your Condition',
                backgroundColor: AppColors.sidebarBackground,
              ),
              SizedBox(height: 12),
              NumberInputComponent(
                  text: 'Leading Icon',
                  backgroundColor: AppColors.sidebarBackground),
            ],
          ),
        ),
      ],
    );
  }
}
