import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/ui/widgets/component_container.dart';

class ColorPickerComponent extends StatefulWidget {
  const ColorPickerComponent({
    super.key,
    this.backgroundColor = AppColors.componentsBackground,
    required this.text,
  });

  final Color backgroundColor;
  final String text;

  @override
  State<ColorPickerComponent> createState() => _ColorPickerComponentState();
}

class _ColorPickerComponentState extends State<ColorPickerComponent> {
  Color myColor = Colors.white;
  final TextStyle textStyle = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    overflow: TextOverflow.ellipsis,
  );
  @override
  Widget build(BuildContext context) {
    return ComponentContainer(
      padding: EdgeInsets.only(left: 10),
      backgroundColor: widget.backgroundColor,
      text: widget.text,
      child: GestureDetector(
        onTap: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => _colorPicker(),
          );
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: myColor,
          ),
        ),
      ),
    );
  }

  Widget _colorPicker() {
    return Dialog(
      child: Container(
        width: 300,
        height: 600,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.sidebarBackground,
        ),
        child: ColorPicker(
          color: myColor,
          enableOpacity: true,
          showColorCode: true,
          colorCodeHasColor: true,
          enableShadesSelection: true,
          showRecentColors: true,
          maxRecentColors: 5,
          recentColors: [],
          onRecentColorsChanged: (List<Color> colors) {},
          recentColorsSubheading: Text('Recent colors', style: textStyle),
          opacitySubheading: Text('Opacity', style: textStyle),
          opacityTrackHeight: 24,
          opacityThumbRadius: 12,
          pickersEnabled: const <ColorPickerType, bool>{
            ColorPickerType.both: false,
            ColorPickerType.accent: false,
            ColorPickerType.bw: false,
            ColorPickerType.custom: false,
            ColorPickerType.primary: false,
            ColorPickerType.wheel: true,
          },
          actionButtons: ColorPickerActionButtons(
            closeButton: true,
            dialogActionButtons: true,
          ),
          onColorChanged: (Color color) => setState(() => myColor = color),
        ),
      ),
    );
  }
}
