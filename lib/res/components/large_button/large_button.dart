import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors/app_color.dart';

class LargeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const LargeButton({
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
              gradient: const LinearGradient(
                colors: [
                  AppColor.linearColor1,
                  AppColor.linearColor2,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Center(
              child: Text(
            title.tr,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.whiteColor),
          )),
        ),
      ),
    );
  }
}
