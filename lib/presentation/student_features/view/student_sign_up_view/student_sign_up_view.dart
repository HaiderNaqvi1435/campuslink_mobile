import 'package:campuslink_mobile/res/components/auth_dropdown/auth_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../res/components/auth_textfield/auth_textfield.dart';
import '../../../../res/components/large_button/large_button.dart';
import '../../../../theme/app_theme_wiget/app_theme_wiget.dart';
import '../../../../utils/padding_utils/padding_utils.dart';

class StudentSignUpView extends StatefulWidget {
  const StudentSignUpView({super.key});

  @override
  State<StudentSignUpView> createState() => _StudentSignUpViewState();
}

class _StudentSignUpViewState extends State<StudentSignUpView> {
  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      title: "sign_up_as_student".tr,
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
                        hintText: "roll_no_hint", labelText: "roll_no"),
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
                    AuthDropdown(
                        onChanged: (value) {},
                        hintText: "program_hint",
                        labelText: "program",
                        // value: "BS",
                        items: const [
                          "BS",
                          "ADP",
                          "BS Bridging",
                        ]),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: AuthDropdown(
                              onChanged: (value) {},
                              hintText: "semester_hint",
                              labelText: "semester",
                              // value: "2nd",
                              items: const [
                                "2nd",
                                "4th",
                                "6th",
                              ]),
                        ),
                        const SizedBox(width: 20),
                        const Expanded(
                          child: AuthTextField(
                              hintText: "session_hint", labelText: "session"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            LargeButton(title: "signup", onPressed: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
