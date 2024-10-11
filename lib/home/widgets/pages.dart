import 'package:flutter/material.dart';
import 'package:web_funnel/core/ui/app_colors.dart';
import 'package:web_funnel/home/widgets/settings.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  bool selectedButton = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Container(
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
                          fontWeight: FontWeight.w700,
                          fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 137,
                    child: ListView(
                      children: List.generate(
                        6,
                        (index) {
                          return Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.only(bottom: 24),
                            decoration: const BoxDecoration(
                                color: AppColors.pageNumber,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                )),
                            padding: const EdgeInsets.all(12),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: AppColors.appBarColor,
                                  fontSize: 48,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Expanded(flex: 3, child: Settings()),
      ],
    );
  }
}
