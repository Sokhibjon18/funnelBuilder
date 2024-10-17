import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/ui/widgets/common_textfield.dart';
import 'package:web_funnel/core/ui/widgets/component_wrapper.dart';

class NumberInputComponent extends StatelessWidget {
  const NumberInputComponent({
    super.key,
    required this.text,
    this.onChanged,
    this.inputFormatters,
    this.padding,
    this.backgroundColor,
    this.maxLength,
    this.controller,
  });

  final String text;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return ComponentWrapper(
      backgroundColor: AppColors.transparent,
      padding: padding ?? const EdgeInsets.only(left: 10, top: 2),
      text: text,
      textFlex: 2,
      child: Expanded(
        flex: 1,
        child: SizedBox(
          height: 52,
          child: CommonTextfield(
            controller: controller,
            radius: 8,
            maxLength: maxLength,
            backgroundColor: backgroundColor ?? AppColors.componentsBackground,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
          ),
        ),
      ),
    );
  }
}
