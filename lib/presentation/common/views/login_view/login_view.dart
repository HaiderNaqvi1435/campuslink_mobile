import 'package:campuslink_mobile/presentation/common/view_models/controller/auth_controller/auth_controller.dart';
import 'package:campuslink_mobile/res/assets/image_assets.dart';
import 'package:campuslink_mobile/res/colors/app_color.dart';
import 'package:campuslink_mobile/res/components/auth_textfield/auth_textfield.dart';
import 'package:campuslink_mobile/res/components/logo_text_widget/logo_text_widget.dart';
import 'package:campuslink_mobile/res/components/large_button/large_button.dart';
import 'package:campuslink_mobile/utils/padding_utils/padding_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../res/components/have_account_widget/have_account_widget.dart';
import '../../../../res/routes/routes_name.dart';
import '../../../../theme/app_theme_wiget/app_theme_wiget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthController lvm = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    lvm.isTeacher = Get.arguments ?? false;
    final Size size = MediaQuery.of(context).size;

    return AppThemeWidget(
      title: "login",
      centerTitle: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: PaddingUtils.defaultPadding,
          child: Column(
            children: [
              const LogoTextWidget(),
              SvgPicture.asset(
                ImageAssets.loginLogo,
                height: size.height / 3,
              ),
              Text(
                "login_to_portal".tr,
                style: const TextStyle(color: AppColor.primaryButtonColor),
              ),
              const SizedBox(height: 20),
              AuthTextField(
                labelText: lvm.isTeacher! ? "teacher_id" : "student_id",
                hintText: 'email_hint',
                prefixIcon: Icons.person_2_outlined,
              ),
              AuthTextField(
                  obscureText: true,
                  suffixIcon: Icons.remove_red_eye_outlined
                  // ?? Icons.visibility_off_outlined
                  ,
                  onPressed: () {},
                  hintText: "********",
                  labelText: "password",
                  prefixIcon: Icons.lock_outline),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget Password",
                        style: TextStyle(
                            fontSize: 12, color: AppColor.textButtonColor),
                      )),
                ],
              ),
              LargeButton(
                  title: 'login',
                  onPressed: () async {
                    lvm.login();
                  }),
              HaveAccountWidget(
                isLoginPage: true,
                onPressed: () {
                  if (lvm.isTeacher!) {
                    Get.toNamed(RouteName.signUpViewTeacher);
                  } else {
                    Get.toNamed(RouteName.signUpViewStudent);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
