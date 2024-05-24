import 'package:campuslink_mobile/presentation/common/view_models/controller/sign_up_controller/sign_up_controller.dart';
import 'package:campuslink_mobile/utils/app_text_styles/app_text_styles.dart';
import 'package:campuslink_mobile/utils/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildGenderRadioButtons(SignUpController suc) {
    return Obx(
      () => Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: Text(
                'Male'.tr,
                style: AppTextStyles.blackNormalText,
              ),
              leading: Radio<Gender>(
                value: Gender.male,
                groupValue: suc.controller.genderValue.value,
                onChanged: (Gender? value) {
                  suc.controller.genderValue.value = value!;
                },
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                'Female'.tr,
                style: AppTextStyles.blackNormalText,
              ),
              leading: Radio<Gender>(
                value: Gender.female,
                groupValue: suc.controller.genderValue.value,
                onChanged: (Gender? value) {
                  suc.controller.genderValue.value = value!;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
