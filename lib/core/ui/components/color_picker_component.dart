import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/ui/widgets/component_wrapper.dart';

class ColorPickerComponent extends StatefulWidget {
  const ColorPickerComponent({
    super.key,
    this.backgroundColor = AppColors.componentsBackground,
    required this.text,
    required this.onColorChanged,
  });

  final Color backgroundColor;
  final String text;
  final ValueChanged<Color> onColorChanged;

  @override
  State<ColorPickerComponent> createState() => _ColorPickerComponentState();
}

class _ColorPickerComponentState extends State<ColorPickerComponent> {
  Color myColor = Colors.white;
  final TextStyle textStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    overflow: TextOverflow.ellipsis,
  );

  @override
  Widget build(BuildContext context) {
    return ComponentWrapper(
      padding: EdgeInsets.only(left: 10),
      backgroundColor: widget.backgroundColor,
      text: widget.text,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => _colorPicker(),
          );
        },
        child: Container(
          width: 52,
          height: 52,
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
        width: 400,
        height: 580,
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
            ColorPickerType.primary: true,
            ColorPickerType.accent: true,
            ColorPickerType.custom: true,
            ColorPickerType.both: false,
            ColorPickerType.bw: false,
            ColorPickerType.wheel: false,
          },
          customColorSwatchesAndNames: {
            ColorTools.createPrimarySwatch(Colors.black): 'Black',
            ColorTools.createPrimarySwatch(Colors.white): 'White',
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
