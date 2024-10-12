import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/widgets/component_wrapper.dart';
import 'package:web_funnel/core/ui/components/color_picker_component.dart';
import 'package:web_funnel/core/ui/components/image_picker_component.dart';
import 'package:web_funnel/core/ui/components/selection_component.dart';
import 'package:web_funnel/core/ui/components/switchable_component.dart';
import 'package:web_funnel/core/ui/components/number_input_component.dart';

class PageSettings extends StatelessWidget {
  PageSettings({super.key});
  final List<String> dropdownItems = [Strings.light, Strings.dark];

  @override
  Widget build(BuildContext context) {
    String selectedValue = Strings.dark;
    return Expanded(
      child: Container(
        width: 260,
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
            SelectionComponent(
              selectionText: Strings.statusBar,
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
            ComponentWrapper(
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
                  NumberInputComponent(
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
