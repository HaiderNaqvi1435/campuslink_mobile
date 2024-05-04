import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors/app_color.dart';

class DashboardButton extends StatelessWidget {
  final String imageAsset;
  final String title;
  final VoidCallback? onPressed;
  const DashboardButton({
    super.key,
    required this.imageAsset,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // height: 140,
        // width: 150,
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(color: AppColor.hintColor, width: 1.5),
            bottom: BorderSide(color: AppColor.hintColor, width: 1.5),
            left: BorderSide(color: AppColor.hintColor, width: 1.5),
            right: BorderSide(color: AppColor.hintColor, width: 1.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageAsset,
                fit: BoxFit.fill,
                height: 60,
              ),
              const SizedBox(height: 10),
              Text(
                title.tr,
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
