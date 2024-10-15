import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_funnel/core/constants/app_colors.dart';

class CommonTextfield extends StatelessWidget {
  const CommonTextfield({
    super.key,
    this.controller,
    this.backgroundColor,
    this.radius,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.cursorHeight,
    this.contentPadding,
    this.hint,
    this.maxLength,
    this.maxLines,
    this.minLines,
  });

  final TextEditingController? controller;
  final Color? backgroundColor;
  final double? radius;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final double? cursorHeight;
  final EdgeInsetsGeometry? contentPadding;
  final String? hint;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      cursorHeight: cursorHeight ?? 24,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        counterText: '',
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
          overflow: TextOverflow.ellipsis,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
          overflow: TextOverflow.ellipsis,
        ),
        filled: true,
        fillColor: backgroundColor ?? AppColors.componentsBackground,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
