import 'package:campuslink_mobile/presentation/common/view_models/controller/sign_up_controller/sign_up_controller.dart';
import 'package:campuslink_mobile/res/components/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildPasswordTextField(SignUpController suc) {
    return Obx(
      () => CustomTextField(
        keyboardType: TextInputType.visiblePassword,
        controller: suc.controller.passwordController.value,
        obscureText: suc.obscureText.value,
        suffixIcon: suc.obscureText.isTrue
            ? Icons.remove_red_eye_outlined
            : Icons.visibility_off_outlined,
        onPressed: () {
          suc.obscureText.value = !suc.obscureText.value;
        },
        hintText: "********",
        labelText: "password".tr,
      ),
    );
  }
