import 'package:flutter/material.dart';
import 'package:web_funnel/core/ui/app_colors.dart';

class Elements extends StatelessWidget {
  Elements({super.key});

  final List<ElementData> elements = [
    ElementData(Icons.text_format_outlined, 'Text'),
    ElementData(Icons.image_outlined, 'Image'),
    ElementData(Icons.check_box_outlined, 'Multiple \nChoice'),
    ElementData(Icons.text_fields_outlined, 'Text Field'),
    ElementData(Icons.smart_button, 'Button'),
    ElementData(Icons.space_bar_outlined, 'Spacer'),
    ElementData(Icons.subscriptions_outlined, 'Subscription'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Base Elements',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: MediaQuery.of(context).size.height - 300,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(elements.length, (index) {
                return _buildElementContainer(elements[index]);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildElementContainer(ElementData element) {
    return Container(
      height: 175,
      width: 175,
      decoration: BoxDecoration(
        color: AppColors.pagesColors,
        border: Border.all(color: AppColors.white, width: 3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(element.icon, color: AppColors.white, size: 48),
          const SizedBox(height: 8),
          Text(
            element.name,
            style: const TextStyle(color: AppColors.white, fontSize: 24),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

class ElementData {
  final IconData icon;
  final String name;

  ElementData(this.icon, this.name);
}
