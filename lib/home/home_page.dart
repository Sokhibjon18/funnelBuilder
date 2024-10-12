import 'package:flutter/material.dart';
import 'package:web_funnel/core/ui/app_colors.dart';
import 'package:web_funnel/home/widgets/funnel_bar.dart';
import 'package:web_funnel/home/widgets/pages_column.dart';
import 'package:web_funnel/home/widgets/page_modifier_column.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const FunnelBar(),
      body: Row(
        children: [
          const PagesColumn(),
          const PageModifierColumn(),
          Container()
        ],
      ),
    );
  }
}
