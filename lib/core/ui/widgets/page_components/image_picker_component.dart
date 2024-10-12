import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/widgets/component_container.dart';

class ImagePickerComponent extends StatelessWidget {
  const ImagePickerComponent({
    super.key,
    this.backgroundColor = AppColors.componentsBackground,
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ComponentContainer(
      backgroundColor: backgroundColor,
      text: Strings.backgroundImage,
    );
  }
}
