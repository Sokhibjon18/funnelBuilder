import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_funnel/core/extensions/theme_extensions.dart';
import 'package:web_funnel/core/widgets/common_button.dart';

@RoutePage()
class PhoneSkeletonPage extends StatefulWidget {
  const PhoneSkeletonPage({super.key});

  @override
  State<PhoneSkeletonPage> createState() => _PhoneSkeletonPageState();
}

class _PhoneSkeletonPageState extends State<PhoneSkeletonPage> {
  final List<Widget> _items = [
    const Text(
      'Web Funnel',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
    ),
    const SizedBox(height: 10),
    const Text(
      'Step 1: Introduction',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
    ),
    const SizedBox(height: 20),
    const Text(
      'Step 2: Fill Information',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
    ),
    const SizedBox(height: 10),
  ];

  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: context.colors.window,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                width: screenWidth * 0.25,
                child: Stack(
                  children: [
                    Container(
                      height: screenHeight * 0.85,
                      width: screenWidth * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(88),
                        border: Border.all(color: context.colors.black, width: 8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                            child: CommonButton.elevated(
                              textColor: context.colors.white,
                              elevation: 0,
                              text: 'Continue',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 107,
                      left: 8,
                      right: 8,
                      bottom: 48,
                      child: Container(
                        decoration: BoxDecoration(color: context.colors.white),
                        child: _buildOrderableColumn(context),
                      ),
                    ),
                    _topNotch(context: context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderableColumn(BuildContext context) {
    return ReorderableListView(
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
      children: [
        for (int index = 0; index < _items.length; index++)
          GestureDetector(
            key: ValueKey(_items[index]),
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: _selectedIndex == index ? context.colors.black : Colors.transparent,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: _items[index],
            ),
          ),
      ],
    );
  }

  Widget _topNotch({required BuildContext context}) {
    return SizedBox(
      height: 99,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '9:41',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: context.colors.white,
              ),
            ),
            Container(
              height: 40,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: context.colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
