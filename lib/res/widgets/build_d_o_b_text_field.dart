import 'package:campuslink_mobile/presentation/common/view_models/controller/sign_up_controller/sign_up_controller.dart';
import 'package:campuslink_mobile/res/colors/app_color.dart';
import 'package:campuslink_mobile/res/components/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/utils.dart';

Widget buildDOBTextField(BuildContext context, SignUpController suc) {
  return CustomTextField(
    readOnly: true,
    controller: suc.controller.dobController.value,
    color: AppColor.primaryColor,
    suffixIcon: Icons.calendar_month,
    onTap: () async {
      suc.controller.datetime.value =
          (await Utils.selectDate(context, DateTime.now()))!;
      suc.controller.dobController.value.text =
          DateFormat('dd MMMM yyyy').format(suc.controller.datetime.value);
    },
    hintText: "dob_hint".tr,
    labelText: "dob".tr,
  );
}
