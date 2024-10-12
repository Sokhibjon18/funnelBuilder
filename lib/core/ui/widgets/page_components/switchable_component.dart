import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/ui/widgets/component_container.dart';

class SwitchableComponent extends StatefulWidget {
  const SwitchableComponent({
    super.key,
    required this.onSwitched,
    required this.text,
    this.padding,
  });

  final ValueChanged<bool> onSwitched;
  final String text;
  final EdgeInsetsGeometry? padding;

  @override
  State<SwitchableComponent> createState() => _SwitchableComponentState();
}

class _SwitchableComponentState extends State<SwitchableComponent> {
  bool _isSwitchedOn = false;
  @override
  Widget build(BuildContext context) {
    return ComponentContainer(
      padding: widget.padding ?? EdgeInsets.fromLTRB(10, 8, 0, 8),
      backgroundColor: AppColors.transparent,
      text: widget.text,
      child: Switch(
        activeColor: AppColors.white,
        splashRadius: 10,
        inactiveThumbColor: AppColors.white,
        inactiveTrackColor: AppColors.switchBorder,
        trackOutlineWidth: WidgetStateProperty.resolveWith<double>((states) {
          if (states.contains(WidgetState.selected)) {
            return 0;
          }
          return 1;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.switchOnBackground;
          }
          return AppColors.switchBorder;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.switchOnBackground;
          }
          return AppColors.componentsBackground;
        }),
        value: _isSwitchedOn,
        onChanged: (value) {
          setState(() {
            _isSwitchedOn = value;
          });
          widget.onSwitched(value);
        },
      ),
    );
  }
}
