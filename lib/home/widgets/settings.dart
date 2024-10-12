import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:web_funnel/core/ui/app_colors.dart';
import 'package:web_funnel/home/widgets/elements.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String selectedTab = 'Elements';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: MediaQuery.of(context).size.height,
      color: AppColors.pagesColors,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedButtonBar(
            radius: 12.0,
            padding: const EdgeInsets.all(24.0),
            backgroundColor: AppColors.buttonColor,
            foregroundColor: AppColors.blue,
            elevation: 1,
            innerVerticalPadding: 8,
            children: [
              ButtonBarEntry(
                onTap: () {
                  setState(() {
                    selectedTab = 'Elements';
                  });
                },
                child: const Text(
                  'Elements',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ButtonBarEntry(
                onTap: () {
                  setState(() {
                    selectedTab = 'Page Setting';
                  });
                },
                child: const Text(
                  'Page Setting',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          if (selectedTab == 'Elements') ...[
            Elements()
          ] else if (selectedTab == 'Page Setting') ...[
            // const PageSettings()
          ]
        ],
      ),
    );
  }
}
