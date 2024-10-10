import 'package:flutter/material.dart';
import 'package:web_funnel/core/extensions/theme_extensions.dart';

class CommonButton extends StatelessWidget {
  const CommonButton._(
    this.text,
    this.loading,
    this.shadow,
    this.enabled,
    this.onPressed,
    this.type, {
    super.key,
    this.radius,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.padding,
    this.prefixIcon,
    this.elevation,
  });

  final String text;
  final bool loading;
  final bool shadow;
  final bool enabled;
  final VoidCallback? onPressed;
  final double? radius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Widget? icon;
  final double? padding;
  final CommonButtonType type;
  final Widget? prefixIcon;
  final double? elevation;

  const CommonButton.outlined({
    required String text,
    bool loading = false,
    bool shadow = false,
    bool enabled = true,
    VoidCallback? onPressed,
    double? radius,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    Key? key,
    Widget? icon,
    double? padding,
  }) : this._(
          text,
          loading,
          shadow,
          enabled,
          onPressed,
          radius: radius,
          CommonButtonType.outlined,
          backgroundColor: backgroundColor,
          textColor: textColor,
          key: key,
          icon: icon,
          padding: padding,
          borderColor: borderColor,
        );

  const CommonButton.elevated({
    required String text,
    bool loading = false,
    bool shadow = false,
    bool enabled = true,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? textColor,
    Widget? icon,
    double? radius,
    Key? key,
    double? padding,
    double? elevation,
  }) : this._(
          backgroundColor: backgroundColor,
          textColor: textColor,
          text,
          loading,
          shadow,
          enabled,
          onPressed,
          radius: radius,
          CommonButtonType.elevated,
          key: key,
          icon: icon,
          padding: padding,
          elevation: elevation,
        );

  const CommonButton.text({
    required String text,
    bool loading = false,
    bool shadow = false,
    bool enabled = true,
    VoidCallback? onPressed,
    double radius = 0,
    Key? key,
    double? padding,
    Widget? prefixIcon,
  }) : this._(
          text,
          loading,
          shadow,
          enabled,
          onPressed,
          radius: radius,
          CommonButtonType.text,
          key: key,
          padding: padding,
          prefixIcon: prefixIcon,
        );

  VoidCallback? _onPressed() {
    if (!enabled) return null;
    return () {
      if (loading) return;
      onPressed?.call();
    };
  }

  Widget _child(Color color) {
    return loading
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              strokeWidth: 3,
              backgroundColor: color,
            ),
          )
        : Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: icon != null,
                  child: Row(
                    children: [
                      icon ?? SizedBox.shrink(),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.fade,
                      color: textColor,
                    ),
                  ),
                )
              ],
            ),
          );
  }

  Widget _outlined(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? context.colors.containerColor,
          side: BorderSide(
            color: borderColor ?? context.colors.containerBorder,
          ),
          shape: radius == null
              ? StadiumBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius!),
                ),
        ),
        onPressed: _onPressed(),
        child: _child(textColor ?? context.colors.header),
      ),
    );
  }

  Widget _elevated(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: shadow
          ? BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: context.colors.primary.withOpacity(0.2),
                  spreadRadius: 8,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            )
          : null,
      child: ElevatedButton(
        onPressed: _onPressed(),
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 4,
          shadowColor: context.colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 12),
          ),
          backgroundColor:
              enabled ? backgroundColor ?? context.colors.primary : context.colors.disable,
        ),
        child: _child(
          enabled ? textColor ?? context.colors.white : context.colors.primary,
        ),
      ),
    );
  }

  Widget _text(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      onPressed: _onPressed(),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: context.colors.white,
            ),
          ),
          const SizedBox(width: 4),
          Visibility(visible: prefixIcon != null, child: prefixIcon!),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case CommonButtonType.outlined:
        return _outlined(context);
      case CommonButtonType.elevated:
        return _elevated(context);
      case CommonButtonType.text:
        return _text(context);
    }
  }
}

enum CommonButtonType { outlined, elevated, text }
