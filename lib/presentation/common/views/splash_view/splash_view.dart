import 'dart:async';

import 'package:campuslink_mobile/utils/app_constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/components/logo_text_widget/logo_text_widget.dart';
import '../../../../res/widgets/build_progress_indicator.dart';
import '../../view_models/controller/auth_controller/auth_controller.dart';
import '../../view_models/controller/batch_controller/batch_controller.dart';
import '../../view_models/controller/department_controller/department_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AuthController avm = Get.put(AuthController(), permanent: true);
  final bc = Get.put(BatchController(), permanent: true);
  final dc = Get.put(DepartmentController(),permanent: true);
  // final fc= Get.put(FacultyController(),permanent: true);
  // final rc= Get.put(RoomController(),permanent: true);
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      avm.checkLoginSession();
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
            buildProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
