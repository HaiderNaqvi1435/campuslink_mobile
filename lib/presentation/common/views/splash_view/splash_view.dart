import 'dart:async';

import 'package:campuslink_mobile/res/app_constants/app_constants.dart';
import 'package:campuslink_mobile/res/colors/app_color.dart';
import 'package:campuslink_mobile/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/components/logo_text_widget/logo_text_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.offAndToNamed(RouteName.initialLoginView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageAssets.splashLogo),
            const SizedBox(height: 20),
            const LogoTextWidget(),
            SizedBox(height: AppConstants.screenHeight(context) * .2),
            const CircularProgressIndicator(
              color: AppColor.indicatorColor,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
