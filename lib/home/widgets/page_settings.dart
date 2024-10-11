import 'package:flutter/material.dart';
import 'package:web_funnel/core/ui/app_colors.dart';

class PageSettings extends StatefulWidget {
  const PageSettings({super.key});

  @override
  State<PageSettings> createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  String selectedText = 'Option 1';
  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];
  bool blurImage = false;
  bool autoNavigation = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 48, right: 48, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Styles',
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          _buildDropdownContainer('Status Bar', _buildDropdown()),
          const SizedBox(height: 12),
          _buildTextContainer('Background Image'),
          _buildRowWithSwitch('Blur Image', blurImage, (value) {
            setState(() {
              blurImage = value; // Switch o'zgarishi
            });
          }),
          _buildTextContainer('Background Color'),
          const SizedBox(height: 12),
          _buildAutoNavigationContainer(),
        ],
      ),
    );
  }

  Widget _buildDropdownContainer(String title, Widget dropdown) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17.5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColors.appBarColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title, style: _whiteTextStyle()), dropdown],
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButton<String>(
      underline: const SizedBox.shrink(),
      value: selectedText,
      dropdownColor: AppColors.pagesColors,
      style: _whiteTextStyle(),
      icon: const Icon(Icons.keyboard_arrow_down),
      items: options
          .map(
              (String item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: (String? newValue) {
        if (newValue != null) setState(() => selectedText = newValue);
      },
    );
  }

  Widget _buildTextContainer(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColors.appBarColor,
      ),
      child: Text(text, style: _whiteTextStyle()),
    );
  }

  Widget _buildRowWithSwitch(
      String label, bool selected, ValueChanged<bool> onChanged) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: _whiteTextStyle()),
          Switch(
            value: selected,
            onChanged: onChanged, // Switch o'zgarishi uchun onChanged qo'shildi
          ),
        ],
      ),
    );
  }

  Widget _buildRowWithTextField(String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: _whiteTextStyle()),
          SizedBox(
            width: 75,
            height: 36,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAutoNavigationContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 24, bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.buttonColor,
      ),
      child: Column(
        children: [
          _buildRowWithSwitch('Auto Navigation', autoNavigation, (value) {
            setState(() {
              autoNavigation = value; // Auto Navigation switchi o'zgarishi
            });
          }),
          const SizedBox(height: 12),
          _buildRowWithTextField('Duration in sec'),
        ],
      ),
    );
  }

  TextStyle _whiteTextStyle() => const TextStyle(
      color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 24);
}
