import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors/app_color.dart';

class SimpleLargeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const SimpleLargeButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColor.hintColor),
          child: Center(
              child: Text(
            title.tr,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.blackColor),
          )),
        ),
      ),
    );
  }
}
