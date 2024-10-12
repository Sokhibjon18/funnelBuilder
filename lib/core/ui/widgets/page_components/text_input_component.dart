import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/ui/widgets/common_textfield.dart';
import 'package:web_funnel/core/ui/widgets/component_container.dart';

class TextInputComponent extends StatelessWidget {
  const TextInputComponent({
    super.key,
    this.backgroundColor,
    required this.text,
  });

  final Color? backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ComponentContainer(
      height: 82,
      backgroundColor: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 32,
            child: CommonTextfield(
              radius: 8,
              hint: 'Text here',
              backgroundColor: AppColors.sidebarBackground,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
