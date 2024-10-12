import 'package:flutter/material.dart';
import 'package:web_funnel/core/ui/app_colors.dart';
import 'package:web_funnel/home/widgets/funnel_bar.dart';
import 'package:web_funnel/home/widgets/pages.dart';
import 'package:web_funnel/home/widgets/settings.dart';

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
          const Pages(),
          const Settings(),
          Container()
          // Expanded(flex: 4, child: Container()),
          // const Components(),
        ],
      ),
    );
  }
}
