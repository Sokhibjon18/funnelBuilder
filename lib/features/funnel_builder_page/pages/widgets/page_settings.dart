import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/widgets/component_container.dart';
import 'package:web_funnel/core/ui/widgets/page_components/color_picker_component.dart';
import 'package:web_funnel/core/ui/widgets/page_components/image_picker_component.dart';
import 'package:web_funnel/core/ui/widgets/page_components/status_selection_component.dart';
import 'package:web_funnel/core/ui/widgets/page_components/switchable_component.dart';
import 'package:web_funnel/core/ui/widgets/page_components/value_input_component.dart';

class PageSettings extends StatelessWidget {
  const PageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> dropdownItems = [Strings.light, Strings.dark];
    String selectedValue = Strings.dark;
    return Expanded(
      child: Container(
        width: 260,
        padding: EdgeInsets.all(24.0),
        color: AppColors.sidebarBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.styles,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            StatusSelectionComponent(
              defaultSelectedValue: selectedValue,
              dropdownItems: dropdownItems,
              onValueChanged: (String value) {},
            ),
            const SizedBox(height: 12),
            ImagePickerComponent(),
            const SizedBox(height: 12),
            SwitchableComponent(
              onSwitched: (value) {},
              text: Strings.blurImage,
            ),
            const SizedBox(height: 12),
            ColorPickerComponent(
              text: Strings.backgroundColor,
            ),
            const SizedBox(height: 12),
            ComponentContainer(
              height: 96,
              padding: EdgeInsets.only(right: 4, left: 10),
              child: Column(
                children: [
                  SwitchableComponent(
                    text: Strings.autoNavigation,
                    padding: EdgeInsets.zero,
                    onSwitched: (value) {},
                  ),
                  const SizedBox(height: 8),
                  ValueInputComponent(
                    backgroundColor: AppColors.sidebarBackground,
                    padding: EdgeInsets.zero,
                    text: Strings.durationSec,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
