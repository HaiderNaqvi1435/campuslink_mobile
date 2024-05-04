import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/app_color.dart';

class LogoTextWidget extends StatelessWidget {
  const LogoTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'logo_text1'.tr,
        style: GoogleFonts.pacifico(
          textStyle: const TextStyle(
            color: AppColor.blackColor,
            fontSize: 32,
          ),
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'logo_text2'.tr,
              style: const TextStyle(color: AppColor.primaryColor)),
        ],
      ),
    );
  }
}
