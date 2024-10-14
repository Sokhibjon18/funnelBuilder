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

class ElementSettingsColumn extends StatefulWidget {
  const ElementSettingsColumn({super.key});

  @override
  State<ElementSettingsColumn> createState() => _ElementSettingsColumnState();
}

class _ElementSettingsColumnState extends State<ElementSettingsColumn> {
  final List<String> buttonTypes = ["Floating", "Pinned"];

  String defaultType = "Floating";

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
                    onValueChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  NumberInputComponent(
                    maxLength: 3,
                    text: Strings.paddingVertical,
                    onChanged: (value) {},
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 12),
                  NumberInputComponent(
                    maxLength: 3,
                    text: Strings.paddingHorizontal,
                    onChanged: (value) {},
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 12),
                  SwitchableComponent(
                    textStyle: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                    text: Strings.button,
                    onSwitched: (value) {},
                  ),
                  const SizedBox(height: 12),
                  ColorPickerComponent(text: Strings.color),
                  const SizedBox(height: 12),
                  ColorPickerComponent(text: Strings.textColor),
                  const SizedBox(height: 12),
                  SelectionComponent(
                    selectionText: Strings.type,
                    dropdownItems: buttonTypes,
                    defaultSelectedValue: defaultType,
                    onValueChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  TextInputComponent(text: Strings.text),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
