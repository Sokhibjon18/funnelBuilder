import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/components/checkable_component.dart';
import 'package:web_funnel/core/ui/components/color_picker_component.dart';
import 'package:web_funnel/core/ui/components/number_input_component.dart';
import 'package:web_funnel/core/ui/components/selection_component.dart';
import 'package:web_funnel/core/ui/components/switchable_component.dart';
import 'package:web_funnel/core/ui/components/text_input_component.dart';
import 'package:web_funnel/data/models/page_setting_models/page_setting_alignments_model.dart';
import 'package:web_funnel/data/models/page_setting_models/page_setting_button_model.dart';
import 'package:web_funnel/data/models/page_setting_models/page_setting_styles_model.dart';

class ElementSettingsColumn extends StatefulWidget {
  const ElementSettingsColumn({super.key});

  @override
  State<ElementSettingsColumn> createState() => _ElementSettingsColumnState();
}

class _ElementSettingsColumnState extends State<ElementSettingsColumn> {
  late String defaultType;
  PageSettingAlignmentModel pageSettingAlignmentModel = PageSettingAlignmentModel.initial();
  PageSettingButtonModel pageSettingButtonModel = PageSettingButtonModel.initial();

  @override
  void initState() {
    defaultType = PageSettingStylesModel.buttonTypeItems[0];
    pageSettingButtonModel = pageSettingButtonModel.copyWith(type: defaultType);
    super.initState();
  }

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
            Strings.alignments,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CheckableComponent(
                    isChecked: pageSettingAlignmentModel.isScrollable,
                    onValueChanged: (value) {
                      pageSettingAlignmentModel =
                          pageSettingAlignmentModel.copyWith(isScrollable: value);
                    },
                  ),
                  const SizedBox(height: 12),
                  NumberInputComponent(
                    maxLength: 3,
                    inputtedText: pageSettingAlignmentModel.paddingVertical.toString(),
                    headerText: Strings.paddingVertical,
                    onChanged: (value) {
                      pageSettingAlignmentModel =
                          pageSettingAlignmentModel.copyWith(paddingVertical: int.tryParse(value));
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 12),
                  NumberInputComponent(
                    maxLength: 3,
                    inputtedText: pageSettingAlignmentModel.paddingHorizontal.toString(),
                    headerText: Strings.paddingHorizontal,
                    onChanged: (value) {
                      pageSettingAlignmentModel = pageSettingAlignmentModel.copyWith(
                          paddingHorizontal: int.tryParse(value));
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 12),
                  SwitchableComponent(
                    switchValue: pageSettingButtonModel.hasButton,
                    textStyle: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                    text: Strings.button,
                    onSwitched: (value) {
                      pageSettingButtonModel = pageSettingButtonModel.copyWith(hasButton: value);
                    },
                  ),
                  const SizedBox(height: 12),
                  ColorPickerComponent(
                    text: Strings.color,
                    onColorChanged: (color) {
                      pageSettingButtonModel = pageSettingButtonModel.copyWith(buttonColor: color);
                    },
                  ),
                  const SizedBox(height: 12),
                  ColorPickerComponent(
                    text: Strings.textColor,
                    onColorChanged: (color) {
                      pageSettingButtonModel = pageSettingButtonModel.copyWith(textColor: color);
                    },
                  ),
                  const SizedBox(height: 12),
                  SelectionComponent(
                    selectionText: Strings.type,
                    dropdownItems: PageSettingStylesModel.buttonTypeItems,
                    defaultSelectedValue: pageSettingButtonModel.type,
                    onValueChanged: (value) {
                      pageSettingButtonModel = pageSettingButtonModel.copyWith(type: value);
                    },
                  ),
                  const SizedBox(height: 12),
                  TextInputComponent(
                    inputtedText: pageSettingButtonModel.buttonText,
                    text: Strings.text,
                    onChanged: (text) {
                      pageSettingButtonModel = pageSettingButtonModel.copyWith(buttonText: text);
                      log(pageSettingButtonModel.toString());
                      log(pageSettingAlignmentModel.toString());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
