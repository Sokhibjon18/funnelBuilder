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
  });

  final String text;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ComponentWrapper(
      backgroundColor: AppColors.transparent,
      padding: padding ?? const EdgeInsets.only(left: 10),
      text: text,
      textFlex: 2,
      child: Expanded(
        flex: 1,
        child: SizedBox(
          height: 32,
          child: CommonTextfield(
            radius: 8,
            backgroundColor: backgroundColor ?? AppColors.componentsBackground,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
          ),
        ),
      ),
    );
  }
}
