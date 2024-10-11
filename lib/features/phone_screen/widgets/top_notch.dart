import 'dart:math';

import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/theme_colors.dart';

class TopNotch extends StatelessWidget {
  const TopNotch({super.key, required this.phoneWidth});

  final double phoneWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: phoneWidth * 0.2,
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(80)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              '9:41',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 40,
              width: phoneWidth * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: AppColors.black,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.signal_cellular_alt_rounded,
                  color: AppColors.white,
                  size: 16,
                ),
                const SizedBox(width: 2),
                Icon(
                  Icons.wifi_rounded,
                  color: AppColors.white,
                  size: 16,
                ),
                const SizedBox(width: 2),
                Transform.rotate(
                  angle: pi / 2,
                  child: Icon(
                    Icons.battery_full_rounded,
                    color: AppColors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
