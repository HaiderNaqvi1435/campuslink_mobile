import 'package:flutter/material.dart';

import '../../colors/app_color.dart';

class WeekDaysListView extends StatelessWidget {
 
  final int selectedIndex;
  final ValueChanged<int>? onTap;
final List<String> days;
  const WeekDaysListView({
    super.key,
    required this.selectedIndex,
    required this.days,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTap?.call(index),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? AppColor.secondaryButtonColor
                    : AppColor.whiteColor,
                border: Border.all(
                  color: AppColor.hintColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                days[index],
                style: TextStyle(
                  color: selectedIndex == index
                      ? AppColor.whiteColor
                      : AppColor.blackColor,
                  fontSize: 10,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}