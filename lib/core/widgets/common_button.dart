import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/theme_colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.onPressed,
    required this.text,
    this.radius,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.elevation,
  });

  final void Function()? onPressed;
  final String text;
  final double? radius;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 32),
          ),
          backgroundColor: backgroundColor ?? AppColors.black,
          elevation: elevation,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: textColor ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}
