import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/features/funnel_builder_page/pages/widgets/element_customization_settings.dart';
import 'package:web_funnel/features/funnel_builder_page/pages/widgets/page_settings.dart';
import 'package:web_funnel/features/phone_skeleton/phone_skeleton.dart';

@RoutePage()
class FunnelBuilderPage extends StatelessWidget {
  const FunnelBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.window,
      body: Row(
        children: [
          _wrapper(child: PageSettings()),
          _wrapper(
            crossAxisAlignment: CrossAxisAlignment.center,
            child: PhoneSkeleton(),
          ),
          _wrapper(
            crossAxisAlignment: CrossAxisAlignment.end,
            child: ElementCustomizationSettings(),
          ),
        ],
      ),
    );
  }

  Widget _wrapper({
    required Widget child,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [child],
      ),
    );
  }
}
