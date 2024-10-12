import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';

class ReorderableWidgets extends StatefulWidget {
  const ReorderableWidgets({super.key, required this.widgetsList});

  final List<Widget> widgetsList;

  @override
  State<ReorderableWidgets> createState() => _ReorderableWidgetsState();
}

class _ReorderableWidgetsState extends State<ReorderableWidgets> {
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    List<Widget> items = widget.widgetsList;
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
      ),
      child: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
            _selectedIndex = newIndex;
          });
        },
        primary: true,
        physics: const BouncingScrollPhysics(),
        buildDefaultDragHandles: false,
        children: [
          for (int index = 0; index < items.length; index++)
            GestureDetector(
              key: ValueKey(items[index]),
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: ReorderableDragStartListener(
                index: index,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _selectedIndex == index ? AppColors.black : AppColors.transparent,
                      width: 1,
                    ),
                    color: AppColors.transparent,
                  ),
                  child: items[index],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
