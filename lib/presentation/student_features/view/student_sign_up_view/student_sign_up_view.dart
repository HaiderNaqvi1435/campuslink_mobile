import 'package:campuslink_mobile/presentation/student_features/view_models/student_sign_up_view_model/student_sign_up_view_model.dart';
import 'package:campuslink_mobile/res/components/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/components/auth_dropdown/auth_dropdown.dart';
import '../../../../res/components/large_button/large_button.dart';
import '../../../../theme/app_theme_wiget/app_theme_wiget.dart';
import '../../../common/view_models/controller/batch_controller/batch_controller.dart';
import '../../../../res/widgets/build_d_o_b_text_field.dart';
import '../../../../res/widgets/build_gender_radio_buttons.dart';
import '../../../../res/widgets/build_password_text_field.dart';


class StudentSignUpView extends StatefulWidget {
  const StudentSignUpView({super.key});

  @override
  State<StudentSignUpView> createState() => _StudentSignUpViewState();
}

class _StudentSignUpViewState extends State<StudentSignUpView> {
  final StudentSignUpViewModel ssvm = Get.put(StudentSignUpViewModel());

  final BatchController bc = Get.put(BatchController());

  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      title: "sign_up_as_student",
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView(
                children: [
                  AuthDropdown(
                    onChanged: (value) {
                      ssvm.controller.batchValue.value = value!;
                    },
                    hintText: "batch_hint",
                    labelText: "batch",
                    items: bc.getBatchDropdownItems(),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: ssvm.controller.emailController.value,
                    hintText: "email_hint",
                    labelText: "email",
                  ),
                  const SizedBox(height: 5),
                  buildPasswordTextField(ssvm),
                  const SizedBox(height: 5),
                  CustomTextField(
                    isInteger: true,
                    keyboardType: TextInputType.number,
                    controller: ssvm.controller.rollNoController.value,
                    hintText: "roll_no_hint",
                    labelText: "roll_no",
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: ssvm.controller.nameController.value,
                    hintText: "name_hint",
                    labelText: "name",
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: ssvm.controller.fatherNameController.value,
                    hintText: "father_name_hint",
                    labelText: "father_name",
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    isInteger: true,
                    keyboardType: TextInputType.number,
                    controller: ssvm.controller.cnicController.value,
                    hintText: "cnic_hint",
                    labelText: "cnic",
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    isInteger: true,
                    controller: ssvm.controller.phoneController.value,
                    hintText: "phone_hint",
                    labelText: "phone",
                  ),
                  const SizedBox(height: 5),
                  buildGenderRadioButtons(ssvm),
                  const SizedBox(height: 5),
                  buildDOBTextField(context, ssvm),
                  const SizedBox(height: 5),
                  CustomTextField(
                    keyboardType: TextInputType.streetAddress,
                    controller: ssvm.controller.addressController.value,
                    hintText: "address_hint",
                    labelText: "address",
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: ssvm.controller.cityController.value,
                          hintText: "city_hint",
                          labelText: "city",
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: CustomTextField(
                          controller: ssvm.controller.stateController.value,
                          hintText: "state_hint",
                          labelText: "state",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Obx(()=>
             LargeButton(
              isLoading: ssvm.isLoading.value,
              title: "signup",
              onPressed: () => ssvm.studentSignUp(context),
            ),
          ),
        ],
      ),
    );
  }


}
