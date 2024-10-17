import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/ui/widgets/component_wrapper.dart';

class SwitchableComponent extends StatefulWidget {
  const SwitchableComponent({
    super.key,
    required this.onSwitched,
    required this.text,
    this.padding,
    this.textStyle,
    required this.switchValue,
  });

  final String text;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final ValueChanged<bool> onSwitched;
  final bool switchValue;

  @override
  State<SwitchableComponent> createState() => _SwitchableComponentState();
}

class _SwitchableComponentState extends State<SwitchableComponent> {
  late bool _isSwitchedOn;

  @override
  void initState() {
    _isSwitchedOn = widget.switchValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ComponentWrapper(
      padding: widget.padding ?? EdgeInsets.fromLTRB(10, 8, 0, 8),
      backgroundColor: AppColors.transparent,
      text: widget.text,
      textStyle: widget.textStyle,
      child: Switch(
        activeColor: AppColors.white,
        splashRadius: 10,
        inactiveThumbColor: AppColors.white,
        inactiveTrackColor: AppColors.switchBorder,
        trackOutlineWidth: WidgetStateProperty.resolveWith<double>((states) {
          return states.contains(WidgetState.selected) ? 0 : 1;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
          return states.contains(WidgetState.selected)
              ? AppColors.switchOnBackground
              : AppColors.switchBorder;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          return states.contains(WidgetState.selected)
              ? AppColors.switchOnBackground
              : AppColors.componentsBackground;
        }),
        value: _isSwitchedOn,
        onChanged: (value) {
          setState(() => _isSwitchedOn = value);
          widget.onSwitched(value);
        },
      ),
    );
  }
}
