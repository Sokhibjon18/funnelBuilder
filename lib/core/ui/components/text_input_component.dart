import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/ui/widgets/common_textfield.dart';
import 'package:web_funnel/core/ui/widgets/component_wrapper.dart';

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
    return ComponentWrapper(
      height: 107,
      backgroundColor: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 52,
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
