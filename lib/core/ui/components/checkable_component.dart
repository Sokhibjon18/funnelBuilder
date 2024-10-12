import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/widgets/component_wrapper.dart';

class CheckableComponent extends StatefulWidget {
  const CheckableComponent({
    super.key,
    this.backgroundColor = AppColors.componentsBackground,
    required this.onValueChanged,
  });

  final Color backgroundColor;
  final ValueChanged<bool> onValueChanged;

  @override
  State<CheckableComponent> createState() => _CheckableComponentState();
}

class _CheckableComponentState extends State<CheckableComponent> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ComponentWrapper(
      backgroundColor: widget.backgroundColor,
      text: Strings.scrollable,
      child: Checkbox(
        side: BorderSide(color: AppColors.primaryIcon, width: 2),
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.switchOnBackground;
          }
          return AppColors.componentsBackground;
        }),
        value: _isChecked,
        onChanged: (value) {
          setState(() {
            _isChecked = value!;
          });
        },
      ),
    );
  }
}
