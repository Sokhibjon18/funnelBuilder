import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';

class ComponentWrapper extends StatelessWidget {
  const ComponentWrapper({
    super.key,
    this.height = 52,
    this.backgroundColor,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    this.child,
    this.text,
    this.textFlex = 1,
    this.textStyle,
  });

  final Widget? child;
  final double height;
  final Color? backgroundColor;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final String? text;
  final int textFlex;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor ?? AppColors.componentsBackground,
      ),
      child: text != null
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: textFlex,
                  child: Text(
                    text!,
                    style: textStyle ??
                        TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimary,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
                child ?? const SizedBox.shrink()
              ],
            )
          : child ?? const SizedBox.shrink(),
    );
  }
}
