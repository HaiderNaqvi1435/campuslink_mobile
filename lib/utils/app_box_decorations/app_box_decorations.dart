import 'package:flutter/material.dart';

import '../../res/colors/app_color.dart';

class AppBoxDecoration {
  static BoxDecoration shadowWhiteBox = BoxDecoration(
    color: AppColor.whiteColor, // Container color
    borderRadius: BorderRadius.circular(4.0),
    boxShadow: [
      BoxShadow(
        color: AppColor.labelColor.withOpacity(0.1), // Shadow color
        spreadRadius: 5, // Spread radius
        blurRadius: 7, // Blur radius
        offset: const Offset(0, 2), // Changes position of shadow
      ),
    ],
  );

  static BoxDecoration simplePrimaryBox = BoxDecoration(
    color: AppColor.primaryColor,
    borderRadius: BorderRadius.circular(4.0),
  );

  static const BoxDecoration underLinedBox = BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: AppColor.greyColor1,
        width: 1.0,
      ),
    ),
  );
}
