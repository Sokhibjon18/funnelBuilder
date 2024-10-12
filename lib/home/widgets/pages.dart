import 'package:flutter/material.dart';
import 'package:web_funnel/core/ui/app_colors.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  List<int> pages = List.generate(0, (index) => index + 1);
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: MediaQuery.of(context).size.height,
          color: AppColors.buttonColor,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  'Pages',
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: pages.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == pages.length) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            pages.add(pages.length + 1);
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.pageNumber),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? AppColors.white
                                : AppColors.pageNumber.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Center(
                            child: Text(
                              '${pages[index]}',
                              style: const TextStyle(
                                color: AppColors.pagesColors,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
