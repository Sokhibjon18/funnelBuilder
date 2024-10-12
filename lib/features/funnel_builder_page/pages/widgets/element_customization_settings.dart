import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/widgets/page_components/checkable_component.dart';
import 'package:web_funnel/core/ui/widgets/page_components/color_picker_component.dart';
import 'package:web_funnel/core/ui/widgets/page_components/status_selection_component.dart';
import 'package:web_funnel/core/ui/widgets/page_components/switchable_component.dart';
import 'package:web_funnel/core/ui/widgets/page_components/text_input_component.dart';
import 'package:web_funnel/core/ui/widgets/page_components/value_input_component.dart';

class ElementCustomizationSettings extends StatefulWidget {
  const ElementCustomizationSettings({super.key});

  @override
  State<ElementCustomizationSettings> createState() => _ElementCustomizationSettingsState();
}

class _ElementCustomizationSettingsState extends State<ElementCustomizationSettings> {
  final List<String> buttonTypes = [
    "Floating",
    "Docked",
    "Full Width",
    "Contained",
    "Outlined",
    "Rounded",
    "Flat",
    "Raised",
    "Compact",
    "Icon",
  ];

  String defaultType = "Floating";
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 260,
        padding: EdgeInsets.all(24.0),
        color: AppColors.sidebarBackground,
        child: Column(
          children: [
            CheckableComponent(
              onValueChanged: (value) {},
            ),
            const SizedBox(height: 12),
            ValueInputComponent(
              text: Strings.paddingVertical,
              onChanged: (value) {},
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 12),
            ValueInputComponent(
              text: Strings.paddingHorizontal,
              onChanged: (value) {},
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 12),
            SwitchableComponent(
              text: Strings.button,
              onSwitched: (value) {},
            ),
            const SizedBox(height: 12),
            ColorPickerComponent(
              text: Strings.color,
            ),
            const SizedBox(height: 12),
            ColorPickerComponent(
              text: Strings.textColor,
            ),
            const SizedBox(height: 12),
            StatusSelectionComponent(
              dropdownItems: buttonTypes,
              defaultSelectedValue: defaultType,
              onValueChanged: (value) {},
            ),
            const SizedBox(height: 12),
            TextInputComponent(text: Strings.text),
          ],
        ),
      ),
    );
  }
}
