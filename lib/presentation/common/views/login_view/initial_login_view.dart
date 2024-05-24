import 'package:campuslink_mobile/res/assets/image_assets.dart';
import 'package:campuslink_mobile/res/components/large_button/large_button.dart';
import 'package:campuslink_mobile/res/routes/routes_name.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../res/components/large_button/simple_large_button.dart';

class InitialLoginView extends StatefulWidget {
  const InitialLoginView({super.key});

  @override
  State<InitialLoginView> createState() => _InitialLoginViewState();
}

class _InitialLoginViewState extends State<InitialLoginView> {
  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: "login",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                SvgPicture.asset(
                  ImageAssets.initialLoginLogo,
                  height: MediaQuery.of(context).size.height / 3,
                ),
                const SizedBox(height: 40),
                const Text(
                  textAlign: TextAlign.center,
                  "Let's Connect \nTogether",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                LargeButton(
                    title: "Login As Student",
                    onPressed: () {
                      Get.toNamed(RouteName.loginView);
                    }),
                const SizedBox(
                  height: 10,
                ),
                SimpleLargeButton(
                  title: "Login As Teacher",
                  onPressed: () {
                    Get.toNamed(RouteName.loginView, arguments: true);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
