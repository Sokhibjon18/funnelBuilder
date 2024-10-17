import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';

class CustomDropDawn extends StatefulWidget {
  String selectedItem;
  final double width;
  final List<String> items;
  final ValueChanged<String>? onChanged;
  CustomDropDawn(
      {super.key,
      required this.selectedItem,
      required this.items,
      required this.width,
      this.onChanged});

  @override
  State<CustomDropDawn> createState() => _CustomDropDawnState();
}

class _CustomDropDawnState extends State<CustomDropDawn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.componentsBackground,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          style: TextStyle(color: AppColors.white),
          value: widget.selectedItem,
          dropdownColor: AppColors.componentsBackground,
          items: widget.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              widget.onChanged!(newValue);
            }
          },
        ),
      ),
    );
  }
}
