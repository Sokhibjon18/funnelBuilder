import 'package:flutter/material.dart';
import 'package:web_funnel/core/ui/app_colors.dart';
import 'package:web_funnel/core/ui/widgets/custom_button.dart';

class FunnelBar extends StatelessWidget implements PreferredSizeWidget {
  const FunnelBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.appBarColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProjectNameButton(),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectNameButton() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16, left: 48),
      padding: const EdgeInsets.symmetric(vertical: 17.5, horizontal: 32),
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(Icons.edit, size: 32, color: AppColors.white),
          SizedBox(width: 12),
          Text(
            'Project name',
            style: TextStyle(fontSize: 24, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(right: 48),
      child: Row(
        children: [
          CustomButton(
            text: 'Preview',
            color: AppColors.buttonColor,
            onPressed: () {},
          ),
          const SizedBox(width: 24),
          CustomButton(
            text: 'Publish',
            color: AppColors.blue,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
