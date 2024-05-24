import 'package:campuslink_mobile/presentation/common/view_models/controller/auth_controller/auth_controller.dart';
import 'package:campuslink_mobile/res/assets/image_assets.dart';
import 'package:campuslink_mobile/res/colors/app_color.dart';
import 'package:campuslink_mobile/res/components/custom_textfield/custom_textfield.dart';
import 'package:campuslink_mobile/res/components/logo_text_widget/logo_text_widget.dart';
import 'package:campuslink_mobile/res/components/large_button/large_button.dart';
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
  final avm = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    avm.isTeacher.value = Get.arguments ?? false;
    final Size size = MediaQuery.of(context).size;

    return AppThemeWidget(
      title: "login",
      centerTitle: false,
      child: SingleChildScrollView(
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
            CustomTextField(
              controller: avm.emailController.value,
              labelText: avm.isTeacher.isTrue ? "teacher_id" : "student_id",
              hintText: 'email_hint',
              prefixIcon: Icons.person_2_outlined,
            ),
            Obx(
              () => CustomTextField(
                  controller: avm.passwordController.value,
                  obscureText: avm.obscureText.value,
                  suffixIcon: avm.obscureText.isTrue
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
                  onPressed: () {
                    avm.obscureText.value = !avm.obscureText.value;
                  },
                  hintText: "********",
                  labelText: "password",
                  prefixIcon: Icons.lock_outline),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () =>
                        Get.toNamed(RouteName.forgetPasswordView),
                    child: Text(
                      "forget_password".tr,
                      style: const TextStyle(
                          fontSize: 12, color: AppColor.textButtonColor),
                    )),
              ],
            ),
            Obx(
              () => LargeButton(
                  isLoading: avm.isLoading.value,
                  title: 'login',
                  onPressed: () => avm.login(context)),
            ),
            HaveAccountWidget(
              isLoginPage: true,
              onPressed: () {
                if (avm.isTeacher.isTrue) {
                  Get.toNamed(RouteName.signUpViewTeacher);
                } else {
                  Get.toNamed(RouteName.signUpViewStudent);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
