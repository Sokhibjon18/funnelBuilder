import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/app_colors.dart';
import 'package:web_funnel/ui/builder_page/page_modifier_column/widgets/elements.dart';
import 'package:web_funnel/ui/builder_page/page_modifier_column/widgets/page_settings.dart';

class PageModifierColumn extends StatefulWidget {
  const PageModifierColumn({super.key});

  @override
  State<PageModifierColumn> createState() => _PageModifierColumnState();
}

class _PageModifierColumnState extends State<PageModifierColumn> {
  String selectedTab = 'Elements';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 304,
      height: MediaQuery.of(context).size.height,
      color: AppColors.pageColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedButtonBar(
            radius: 12.0,
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
            backgroundColor: AppColors.buttonColor,
            foregroundColor: AppColors.blue,
            elevation: 1,
            innerVerticalPadding: 8,
            children: [
              ButtonBarEntry(
                onTap: () => setState(() => selectedTab = 'Elements'),
                child: const Text(
                  'Elements',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ButtonBarEntry(
                onTap: () => setState(() => selectedTab = 'Page Setting'),
                child: Text(
                  Strings.pageSetting,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          if (selectedTab == 'Elements') ...[
            Expanded(child: Elements())
          ] else if (selectedTab == 'Page Setting') ...[
            Expanded(child: PageSettings())
          ]
        ],
      ),
    );
  }
}
