import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';

class Elements extends StatelessWidget {
  Elements({super.key});

  final List<ElementData> elements = [
    ElementData(Icons.text_format_outlined, Strings.text),
    ElementData(Icons.image_outlined, Strings.image),
    ElementData(Icons.check_box_outlined, Strings.multipleChoice),
    ElementData(Icons.text_fields_outlined, Strings.textField),
    ElementData(Icons.smart_button, Strings.button),
    ElementData(Icons.space_bar_outlined, 'Spacer'),
    ElementData(Icons.subscriptions_outlined, Strings.subscriptionOptions),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.baseElements,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                spacing: 16.0,
                runSpacing: 16.0,
                children: List.generate(elements.length, (index) {
                  return _buildElementContainer(elements[index]);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildElementContainer(ElementData element) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 120),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.pageColor,
            border: Border.all(color: AppColors.white, width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(element.icon, color: AppColors.primaryIcon, size: 48),
              const SizedBox(height: 8),
              Text(
                element.name,
                style: const TextStyle(color: AppColors.textPrimary, fontSize: 16),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ElementData {
  final IconData icon;
  final String name;

  ElementData(this.icon, this.name);
}
