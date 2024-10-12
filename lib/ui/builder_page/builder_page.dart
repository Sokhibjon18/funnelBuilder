import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_funnel/core/ui/app_colors.dart';
import 'package:web_funnel/ui/builder_page/page_modifier_column/page_modifier_column.dart';
import 'package:web_funnel/ui/builder_page/settings_column/page_settings_column.dart';
import 'package:web_funnel/ui/builder_page/widget/pages_column.dart';
import 'package:web_funnel/ui/builder_page/phone_column/phone_column.dart';
import 'package:web_funnel/ui/builder_page/widget/funnel_bar.dart';

@RoutePage()
class BuilderPage extends StatefulWidget {
  const BuilderPage({super.key});

  @override
  State<BuilderPage> createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const FunnelBar(),
      body: Row(
        children: [
          const PagesSelectionColumn(),
          const PageModifierColumn(),
          Expanded(child: PhoneColumn()),
          const ElementSettingsColumn()
        ],
      ),
    );
  }
}
