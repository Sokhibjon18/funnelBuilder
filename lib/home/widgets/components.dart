import 'package:flutter/material.dart';
import 'package:web_funnel/core/ui/app_colors.dart';

class Components extends StatefulWidget {
  const Components({super.key});

  @override
  State<Components> createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  bool selected = false;
  bool button = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(color: AppColors.pagesColors),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alignments',
            style: TextStyle(color: AppColors.white, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: const BoxDecoration(
                color: AppColors.buttonColor,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Scrollable',
                  style: TextStyle(color: AppColors.white),
                ),
                Checkbox(
                  value: selected,
                  onChanged: (value) {
                    setState(() {
                      selected = value ?? false;
                    });
                  },
                  fillColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.white;
                      }
                      return AppColors.pagesColors;
                    },
                  ),
                  checkColor: AppColors.pagesColors,
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Padding vertical',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 50,
                  height: 36,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Padding horizontal',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 50,
                  height: 36,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Button',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Switch(
                  value: button,
                  onChanged: (value) {
                    setState(() {
                      button = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
