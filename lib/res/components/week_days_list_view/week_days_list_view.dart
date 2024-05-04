import 'package:flutter/material.dart';

import '../../colors/app_color.dart';

class WeekDaysListView extends StatelessWidget {
  const WeekDaysListView({
    super.key,
    required this.selectedIndex,
    required this.days,
    required this.index,
  });

  final int selectedIndex;
  final int index;
  final List<String> days;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: selectedIndex == index
            ? AppColor.secondaryButtonColor
            : AppColor.whiteColor,
        border: Border.all(
          color: AppColor.hintColor, // Color of the border
          width: 1, // Width of the border
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        days[index],
        style: TextStyle(
            color: selectedIndex == index
                ? AppColor.whiteColor
                : AppColor.blackColor,
            fontSize: 10),
      ),
    );
  }
}
