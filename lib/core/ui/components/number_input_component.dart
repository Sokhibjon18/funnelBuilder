import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/ui/widgets/common_textfield.dart';
import 'package:web_funnel/core/ui/widgets/component_wrapper.dart';

class NumberInputComponent extends StatefulWidget {
  const NumberInputComponent({
    super.key,
    required this.headerText,
    this.onChanged,
    this.inputFormatters,
    this.padding,
    this.backgroundColor,
    this.maxLength,
    required this.inputtedText,
  });

  final String headerText;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final int? maxLength;
  final String inputtedText;

  @override
  State<NumberInputComponent> createState() => _NumberInputComponentState();
}

class _NumberInputComponentState extends State<NumberInputComponent> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    textController.text = widget.inputtedText;
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ComponentWrapper(
      backgroundColor: AppColors.transparent,
      padding: widget.padding ?? const EdgeInsets.only(left: 10, top: 2),
      text: widget.headerText,
      textFlex: 2,
      child: Expanded(
        flex: 1,
        child: SizedBox(
          height: 52,
          child: CommonTextfield(
            radius: 8,
            controller: textController,
            maxLength: widget.maxLength,
            backgroundColor: widget.backgroundColor ?? AppColors.componentsBackground,
            onChanged: widget.onChanged,
            inputFormatters: widget.inputFormatters,
          ),
        ),
      ),
    );
  }
}
