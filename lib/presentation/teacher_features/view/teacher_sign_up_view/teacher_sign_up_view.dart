import 'package:campuslink_mobile/presentation/common/view_models/controller/department_controller/department_controller.dart';
import 'package:campuslink_mobile/presentation/teacher_features/view_models/teacher_sign_view_model/teacher_sign_view_model.dart';
import 'package:campuslink_mobile/res/components/custom_textfield/custom_textfield.dart';
import 'package:campuslink_mobile/res/components/large_button/large_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../res/components/auth_dropdown/auth_dropdown.dart';
import '../../../../theme/app_theme_wiget/app_theme_wiget.dart';
import '../../../../res/widgets/build_d_o_b_text_field.dart';
import '../../../../res/widgets/build_gender_radio_buttons.dart';
import '../../../../res/widgets/build_password_text_field.dart';

class TeacherSignUpView extends StatefulWidget {
  const TeacherSignUpView({super.key});

  @override
  State<TeacherSignUpView> createState() => _TeacherSignUpViewState();
}

class _TeacherSignUpViewState extends State<TeacherSignUpView> {
  final tsvm = Get.put(TeacherSignViewModel());
  final dc = Get.put(DepartmentController());

  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      title: "sign_up_as_teacher".tr,
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView(
                children: [
                  AuthDropdown(
                    onChanged: (value) =>
                        tsvm.controller.deptValue.value = value!,
                    hintText: "department_hint".tr,
                    labelText: "department".tr,
                    items: dc.getDeptDropdownItems(),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: tsvm.controller.emailController.value,
                    hintText: "email_hint".tr,
                    labelText: "email".tr,
                  ),
                  const SizedBox(height: 5),
                  buildPasswordTextField(tsvm),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: tsvm.controller.nameController.value,
                    hintText: "name_hint".tr,
                    labelText: "name".tr,
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: tsvm.controller.fatherNameController.value,
                    hintText: "father_name_hint".tr,
                    labelText: "father_name".tr,
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    isInteger: true,
                    keyboardType: TextInputType.number,
                    controller: tsvm.controller.cnicController.value,
                    hintText: "cnic_hint".tr,
                    labelText: "cnic".tr,
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    isInteger: true,
                    controller: tsvm.controller.phoneController.value,
                    hintText: "phone_hint".tr,
                    labelText: "phone".tr,
                  ),
                  const SizedBox(height: 5),
                  buildGenderRadioButtons(tsvm),
                  const SizedBox(height: 5),
                  buildDOBTextField(context, tsvm),
                  const SizedBox(height: 5),
                  CustomTextField(
                    keyboardType: TextInputType.streetAddress,
                    controller: tsvm.controller.addressController.value,
                    hintText: "address_hint".tr,
                    labelText: "address".tr,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: tsvm.controller.cityController.value,
                          hintText: "city_hint".tr,
                          labelText: "city".tr,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: CustomTextField(
                          controller: tsvm.controller.stateController.value,
                          hintText: "state_hint".tr,
                          labelText: "state".tr,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => LargeButton(
              isLoading: tsvm.isLoading.value,
              title: "signup".tr,
              onPressed: () => tsvm.teacherSignUp(context),
            ),
          ),
        ],
      ),
    );
  }
}
