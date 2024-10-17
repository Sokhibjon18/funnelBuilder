import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/components/number_input_component.dart';

class TextSettings extends StatelessWidget {
  const TextSettings({super.key});

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
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NumberInputComponent(
                    headerText: Strings.top,
                    inputtedText: '0',
                    onChanged: (padding) {},
                  ),
                  const SizedBox(height: 8),
                  NumberInputComponent(
                    headerText: Strings.bottom,
                    inputtedText: '0',
                    onChanged: (padding) {},
                  ),
                  const SizedBox(height: 8),
                  NumberInputComponent(
                    headerText: Strings.left,
                    inputtedText: '0',
                    onChanged: (padding) {},
                  ),
                  const SizedBox(height: 8),
                  NumberInputComponent(
                    headerText: Strings.right,
                    inputtedText: '0',
                    onChanged: (padding) {},
                  ),
                  const SizedBox(height: 16),
                  Text(
                    Strings.style,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  NumberInputComponent(
                    headerText: Strings.cornerRadius,
                    inputtedText: '0',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
