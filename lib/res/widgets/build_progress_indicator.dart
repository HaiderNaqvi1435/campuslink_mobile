import 'package:campuslink_mobile/res/colors/app_color.dart';
import 'package:flutter/material.dart';

CircularProgressIndicator buildProgressIndicator() {
    return const CircularProgressIndicator(
            color: AppColor.indicatorColor,
            strokeWidth: 2,
          );
  }