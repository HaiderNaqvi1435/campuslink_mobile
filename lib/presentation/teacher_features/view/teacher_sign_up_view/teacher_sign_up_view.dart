import 'package:campuslink_mobile/res/components/auth_textfield/auth_textfield.dart';
import 'package:campuslink_mobile/res/components/large_button/large_button.dart';
import 'package:campuslink_mobile/utils/padding_utils/padding_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../res/components/auth_dropdown/auth_dropdown.dart';
import '../../../../theme/app_theme_wiget/app_theme_wiget.dart';

class TeacherSignUpView extends StatefulWidget {
  const TeacherSignUpView({super.key});

  @override
  State<TeacherSignUpView> createState() => _TeacherSignUpViewState();
}

class _TeacherSignUpViewState extends State<TeacherSignUpView> {
  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      title: "sign_up_as_teacher".tr,
      child: Padding(
        padding: PaddingUtils.defaultPadding,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AuthTextField(
                        hintText: "email_hint", labelText: "email"),
                    const SizedBox(height: 5),
                    const AuthTextField(
                        hintText: "********", labelText: "password"),
                    const SizedBox(height: 5),
                    const AuthTextField(
                        hintText: "name_hint", labelText: "name"),
                    const SizedBox(height: 5),
                    const AuthTextField(
                        hintText: "cnic_hint", labelText: "cnic"),
                    const SizedBox(height: 5),
                    const AuthTextField(
                        hintText: "phone_hint", labelText: "phone"),
                    const SizedBox(height: 5),
                    AuthDropdown(
                        onChanged: (value) {},
                        hintText: "department_hint",
                        labelText: "department",
                        // value: "Computer Science",
                        items: const [
                          "Computer Science",
                          "Software Engineering",
                          "Information Technology",
                        ]),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            LargeButton(title: "signup", onPressed: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
