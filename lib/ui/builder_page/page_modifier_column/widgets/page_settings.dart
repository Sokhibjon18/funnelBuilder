import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/components/color_picker_component.dart';
import 'package:web_funnel/core/ui/components/image_picker_component.dart';
import 'package:web_funnel/core/ui/components/number_input_component.dart';
import 'package:web_funnel/core/ui/components/selection_component.dart';
import 'package:web_funnel/core/ui/components/switchable_component.dart';
import 'package:web_funnel/core/ui/widgets/component_wrapper.dart';
import 'package:web_funnel/data/models/page_setting_models/page_setting_styles_model.dart';

class PageSettings extends StatefulWidget {
  const PageSettings({super.key});

  @override
  State<PageSettings> createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  PageSettingStylesModel pageSettingStylesModel = PageSettingStylesModel.initial();
  late String selectedValue;

  @override
  void initState() {
    selectedValue = PageSettingStylesModel.themeStatusItems[1];
    pageSettingStylesModel = pageSettingStylesModel.copyWith(statusBar: selectedValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.sidebarBackground,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.styles,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SelectionComponent(
                    selectionText: Strings.statusBar,
                    defaultSelectedValue: selectedValue,
                    dropdownItems: PageSettingStylesModel.themeStatusItems,
                    onValueChanged: (String value) {
                      selectedValue = value;
                      pageSettingStylesModel =
                          pageSettingStylesModel.copyWith(statusBar: selectedValue);
                    },
                  ),
                  const SizedBox(height: 12),
                  ImagePickerComponent(),
                  const SizedBox(height: 12),
                  SwitchableComponent(
                    onSwitched: (value) {
                      pageSettingStylesModel = pageSettingStylesModel.copyWith(blurImage: value);
                    },
                    text: Strings.blurImage,
                  ),
                  const SizedBox(height: 12),
                  ColorPickerComponent(
                    text: Strings.backgroundColor,
                    onColorChanged: (color) {
                      pageSettingStylesModel =
                          pageSettingStylesModel.copyWith(backgroundColor: color);
                    },
                  ),
                  const SizedBox(height: 12),
                  ComponentWrapper(
                    height: 128,
                    padding: EdgeInsets.only(right: 4, left: 10, top: 8, bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SwitchableComponent(
                          text: Strings.autoNavigation,
                          padding: EdgeInsets.zero,
                          onSwitched: (value) {
                            pageSettingStylesModel =
                                pageSettingStylesModel.copyWith(autoNavigation: value);
                          },
                        ),
                        const SizedBox(height: 8),
                        NumberInputComponent(
                          maxLength: 2,
                          backgroundColor: AppColors.sidebarBackground,
                          padding: EdgeInsets.zero,
                          text: Strings.durationSec,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: (value) {
                            pageSettingStylesModel =
                                pageSettingStylesModel.copyWith(durationInSec: int.tryParse(value));

                            log(pageSettingStylesModel.toString());
                          },
                        )
                      ],
                    ),
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
