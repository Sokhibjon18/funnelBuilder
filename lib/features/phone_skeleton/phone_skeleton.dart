import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/extensions/screen_size_extention.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/ui/widgets/common_button.dart';
import 'package:web_funnel/features/phone_skeleton/widgets/reorderable_widgets.dart';
import 'package:web_funnel/features/phone_skeleton/widgets/top_notch.dart';

class PhoneSkeleton extends StatefulWidget {
  const PhoneSkeleton({super.key});

  @override
  State<PhoneSkeleton> createState() => _PhoneSkeletonState();
}

class _PhoneSkeletonState extends State<PhoneSkeleton> {
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
    const double phoneAspectRatio = 9 / 19;
    const double phoneBorderRadius = 40;
    const double phoneBorderWidth = 4;

    double phoneWidth = (context.width * 0.25).clamp(350, 450);
    double phoneHeight = phoneWidth / phoneAspectRatio;

    if (phoneHeight > context.height * 0.85) {
      phoneHeight = context.height * 0.85;
      phoneWidth = phoneHeight * phoneAspectRatio;
    }

    return Expanded(
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
                  borderRadius: BorderRadius.circular(phoneBorderRadius),
                  border: Border.all(color: AppColors.containerBorderPrimary, width: 4),
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
                child: TopNotch(
                  phoneWidth: phoneWidth,
                  phoneRadius: phoneBorderRadius,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _bottomNotch(context: context, phoneWidth: phoneWidth),
              ),
              Positioned(
                bottom: 29,
                left: phoneBorderWidth,
                right: phoneBorderWidth,
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
