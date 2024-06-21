import 'package:campuslink_mobile/res/assets/icon_assets.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:campuslink_mobile/utils/app_text_styles/app_text_styles.dart';
import 'package:campuslink_mobile/utils/date_formatter/date_formatter.dart';
import 'package:campuslink_mobile/utils/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/user_data_model/student_data_model/student_data_model.dart';
import '../../../../data/models/user_data_model/teacher_data_model/teacher_data_model.dart';
import '../../view_models/controller/auth_controller/auth_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      title: "Profile",
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              IconAssets.profileIcon,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height / 3,
            ),
            Obx(() {
              if (authController.teacherData.value.userId != null) {
                return buildTeacherProfile(authController.teacherData.value);
              } else {
                return buildStudentProfile(authController.studentData.value);
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget buildTeacherProfile(TeacherDataModel teacher) {
    return Column(
      children: [
        buildProfileItem("Name", teacher.name ?? ''),
        buildProfileItem("Email", teacher.email ?? ''),
        buildProfileItem("Phone", teacher.phone ?? ''),
        buildProfileItem(
            "Gender", teacher.gender == Gender.male ? "Male" : "Female"),
        buildProfileItem("DOB", DateFormatter.getFormattedDate(teacher.dob!)),
        buildProfileItem("Address",
            '${teacher.address!.address}, ${teacher.address!.city}, ${teacher.address!.state}'),
        buildProfileItem("Department", teacher.departmentId ?? ''),
        buildProfileItem("HOD", "${teacher.isHod ?? false}"),
      ],
    );
  }

  Widget buildStudentProfile(StudentDataModel student) {
    return Column(
      children: [
        buildProfileItem("Name", student.name ?? ''),
        buildProfileItem("Email", student.email ?? ''),
        buildProfileItem("Phone", student.phone ?? ''),
        buildProfileItem(
            "Gender", student.gender == Gender.male ? "Male" : "Female"),
        buildProfileItem("DOB", DateFormatter.getFormattedDate(student.dob!)),
        buildProfileItem("Address",
            '${student.address!.address}, ${student.address!.city}, ${student.address!.state}'),
        buildProfileItem("Roll No", '${student.rollNo ?? ''}'),
        buildProfileItem("Batch ID", student.batchId ?? ''),
      ],
    );
  }
}

Widget buildProfileItem(String title, String value) {
  return ListTile(
    dense: true,
    title: Text(
      title,
      style: AppTextStyles.primaryHeading0,
    ),
    subtitle: Text(
      value,
      style: AppTextStyles.secondaryHeading1,
    ),
  );
}
