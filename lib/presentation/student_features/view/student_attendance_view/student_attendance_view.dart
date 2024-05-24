import 'package:campuslink_mobile/presentation/common/view_models/course_view_model/course_view_model.dart';
import 'package:campuslink_mobile/presentation/student_features/view_models/student_attendance_view_model/student_attendance_view_model.dart';
import 'package:campuslink_mobile/res/widgets/build_progress_indicator.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:campuslink_mobile/utils/app_box_decorations/app_box_decorations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../utils/app_text_styles/app_text_styles.dart';
import '../../../../utils/enums/enums.dart';

class StudentAttendanceView extends StatefulWidget {
  const StudentAttendanceView({super.key});

  @override
  State<StudentAttendanceView> createState() => _StudentAttendanceViewState();
}

class _StudentAttendanceViewState extends State<StudentAttendanceView> {
  final cvm = Get.find<CourseViewModel>();
  final savm = Get.find<StudentAttendanceViewModel>();
  @override
  void initState() {
    savm.getAttendanceByStudent(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      title: "Attendance Records",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              "${cvm.getCourseNameById(savm.input.courseId.value)}",
              style: AppTextStyles.primaryHeading2,
            ),
            subtitle: Text(
              "${cvm.getCourseCodeById(savm.input.courseId.value)}",
              style: AppTextStyles.labelText,
            ),
            trailing: Text(
              "${cvm.getCreditByCode(savm.input.courseId.value)}",
              style: AppTextStyles.labelTextBold,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (savm.isLoading.value) {
                return Center(child: buildProgressIndicator());
              }
              if (savm.studentCourseAttendance.isEmpty) {
                return const Center(
                  child: Text(
                    "No attendance records found",
                  ),
                );
              }

              return ListView.builder(
                itemCount: savm.studentCourseAttendance.length,
                itemBuilder: (context, index) {
                  final attendance = savm.studentCourseAttendance[index];
                  // final student = avm.studentList
                  //     .firstWhere((s) => s.userId == attendance.studentId);

                  return Container(
                    decoration: AppBoxDecoration.underLinedBox,
                    child: ListTile(
                      dense: true,
                      leading: Text(
                        "${index + 1}",
                        style: AppTextStyles.blackNormalText,
                      ),
                      title: Text(
                        DateFormat('dd MMMM yyyy').format(attendance.date!),
                        style: AppTextStyles.secondaryNormalText1,
                      ),
                      // title:
                      //     Text(student.name!, style: AppTextStyles.blackHeading1),
                      // subtitle: Text(
                      //   "Date: ${DateFormat('dd MMMM yyyy').format(attendance.date!)}",
                      //   style: AppTextStyles.blackNormalText,
                      // ),

                      trailing: Text(
                        attendance.status
                            .toString()
                            .split('.')
                            .last
                            .toUpperCase(),
                        style: TextStyle(
                          color: attendance.status == AttendanceStatus.present
                              ? AppColor.greenColor1
                              : attendance.status == AttendanceStatus.absent
                                  ? AppColor.redColor
                                  : AppColor.orangeColor1,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Obx(
            () => ListTile(
              titleTextStyle: AppTextStyles.labelText,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Classes"),
                      Text("Present"),
                      Text("Absents"),
                      Text("Leaves"),
                      Text(
                        "Percentage",
                        style: AppTextStyles.labelTextBold,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(": ${savm.totalAttendance}"),
                      Text(": ${savm.totalPresents}"),
                      Text(": ${savm.totalAbsents}"),
                      Text(": ${savm.totalLeaves}"),
                      Text(
                        ": ${savm.percentage}%",
                        style: AppTextStyles.labelTextBold,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
