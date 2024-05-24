import 'package:campuslink_mobile/presentation/common/view_models/controller/auth_controller/forget_password_controller.dart';
import 'package:campuslink_mobile/res/components/custom_textfield/custom_textfield.dart';
import 'package:campuslink_mobile/res/components/large_button/large_button.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final fpc = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
        title: "forget_password",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
                controller: fpc.emailResetController.value,
                hintText: "email_hint",
                labelText: "email"),
            const SizedBox(height: 20),
            LargeButton(
                isLoading: fpc.isLoading.value,
                width: MediaQuery.of(context).size.width / 3,
                title: "send_email",
                onPressed: () => fpc.sendPasswordResetEmail(context))
          ],
        ));
  }
}
