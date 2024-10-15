import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/ui/widgets/common_textfield.dart';

class TextInputComponent extends StatelessWidget {
  const TextInputComponent({
    super.key,
    this.backgroundColor,
    required this.text,
    this.onChanged,
  });

  final Color? backgroundColor;
  final String text;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor ?? AppColors.componentsBackground,
      ),
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
          CommonTextfield(
            radius: 8,
            minLines: 1,
            maxLines: 3,
            hint: 'Text here',
            backgroundColor: AppColors.sidebarBackground,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
