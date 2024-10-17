import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/components/number_input_component.dart';
import 'package:web_funnel/core/ui/components/selection_component.dart';

class ImageComponents extends StatefulWidget {
  const ImageComponents({super.key});

  @override
  State<ImageComponents> createState() => _ImageComponentsState();
}

class _ImageComponentsState extends State<ImageComponents> {
  String selectedAlign = 'first';

  List<String> alignments = ['first', 'second', 'third'];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      // padding: EdgeInsets.all(24.0),
      color: AppColors.sidebarBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.image,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  Strings.image,
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.componentsBackground,
                  ),
                  child: Center(
                    child: Text(
                      'name.jpg',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 12),
          SelectionComponent(
            dropdownItems: alignments,
            defaultSelectedValue: selectedAlign,
            onValueChanged: (value) {},
            selectionText: Strings.alignments,
          ),
          SizedBox(height: 12),
          NumberInputComponent(text: 'Height'),
          SizedBox(height: 12),
          NumberInputComponent(text: 'Width'),
          SizedBox(height: 12),
          NumberInputComponent(text: 'Corner Radius')
        ],
      ),
    );
  }
}
