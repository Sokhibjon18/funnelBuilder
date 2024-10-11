import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/theme_colors.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/widgets/common_button.dart';
import 'package:web_funnel/features/phone_screen/widgets/reorderable_widgets.dart';
import 'package:web_funnel/features/phone_screen/widgets/top_notch.dart';

@RoutePage()
class PhoneSkeletonPage extends StatefulWidget {
  const PhoneSkeletonPage({super.key});

  @override
  State<PhoneSkeletonPage> createState() => _PhoneSkeletonPageState();
}

class _PhoneSkeletonPageState extends State<PhoneSkeletonPage> {
  final List<Widget> _items = [
    const SizedBox(height: 30),
    const Text(
      'Web Funnel',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: Colors.white),
    ),
    const SizedBox(height: 30),
    const Text(
      'Step 1: Introduction',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: Colors.white),
    ),
    const SizedBox(height: 30),
    const Text(
      'Step 2: Fill Information',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: Colors.white),
    ),
    const SizedBox(height: 30),
    const Text(
      'Web Funnel',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: Colors.white),
    ),
    const SizedBox(height: 30),
    const Text(
      'Step 1: Introduction',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: Colors.white),
    ),
    const SizedBox(height: 30),
    const Text(
      'Step 2: Fill Information',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    const double phoneAspectRatio = 9 / 17.5;

    double phoneWidth = (screenWidth * 0.25).clamp(350, 450);
    double phoneHeight = phoneWidth / phoneAspectRatio;

    if (phoneHeight > screenHeight * 0.85) {
      phoneHeight = screenHeight * 0.85;
      phoneWidth = phoneHeight * phoneAspectRatio;
    }

    return Scaffold(
      backgroundColor: AppColors.window,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                height: phoneHeight,
                width: phoneWidth,
                child: Stack(
                  children: [
                    Container(
                      height: phoneHeight,
                      width: phoneWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(color: AppColors.black, width: 8),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pinimg.com/564x/b0/69/d7/b069d71d2a1d7879b583802a9847b12d.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: phoneWidth * 0.23,
                      left: 8,
                      right: 8,
                      bottom: 89,
                      child: SizedBox(
                        child: ReorderableWidgets(widgetsList: _items),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      right: 8,
                      child: TopNotch(phoneWidth: phoneWidth),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: _bottomNotch(context: context, phoneWidth: phoneWidth),
                    ),
                    Positioned(
                      bottom: 29,
                      left: 8,
                      right: 8,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: CommonButton(
                          textColor: AppColors.white,
                          elevation: 0,
                          text: Strings.continueText,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNotch({required BuildContext context, required double phoneWidth}) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: phoneWidth * 0.4,
        height: 8,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(64),
        ),
      ),
    );
  }
}
