import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/extensions/screen_size_extention.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/widgets/common_button.dart';

import 'widgets/reorderable_widgets.dart';
import 'widgets/top_notch.dart';

class PhoneColumn extends StatefulWidget {
  const PhoneColumn({super.key});

  @override
  State<PhoneColumn> createState() => _PhoneColumnState();
}

class _PhoneColumnState extends State<PhoneColumn> {
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

  final double phoneAspectRatio = 9 / 19;
  final double phoneBorderRadius = 60;
  final double phoneBorderWidth = 4;

  @override
  Widget build(BuildContext context) {
    double phoneWidth = (context.width * 0.25).clamp(350, 450);
    double phoneHeight = phoneWidth / phoneAspectRatio;

    if (phoneHeight > context.height * 0.85) {
      phoneHeight = context.height * 0.85;
      phoneWidth = phoneHeight * phoneAspectRatio;
    }

    return Expanded(
      child: Center(
        child: Container(
          height: phoneHeight,
          width: phoneWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(phoneBorderRadius),
            border: Border.all(color: AppColors.containerBorderPrimary, width: 4),
            image: DecorationImage(
              image: NetworkImage(
                'https://i.pinimg.com/564x/b0/69/d7/b069d71d2a1d7879b583802a9847b12d.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: phoneWidth * 0.23,
                left: phoneBorderWidth,
                right: phoneBorderWidth,
                bottom: 89,
                child: SizedBox(
                  child: ReorderableWidgets(widgetsList: _items),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: TopNotch(phoneWidth: phoneWidth, phoneRadius: phoneBorderRadius),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _bottomNotch(context: context, phoneWidth: phoneWidth),
              ),
              Positioned(
                bottom: 29,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: CommonButton(
                    backgroundColor: AppColors.actionBlack,
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
    );
  }

  Widget _bottomNotch({required BuildContext context, required double phoneWidth}) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: phoneWidth * 0.4,
        height: 4,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
