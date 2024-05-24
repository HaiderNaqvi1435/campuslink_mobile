// ignore_for_file: use_build_context_synchronously

import 'package:campuslink_mobile/presentation/common/view_models/attendance_view_model/attendance_view_model.dart';
import 'package:campuslink_mobile/presentation/common/view_models/controller/batch_controller/batch_controller.dart';
import 'package:campuslink_mobile/presentation/common/view_models/course_view_model/course_view_model.dart';
import 'package:campuslink_mobile/res/colors/app_color.dart';
import 'package:campuslink_mobile/res/routes/routes_name.dart';
import 'package:campuslink_mobile/res/widgets/build_progress_indicator.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:campuslink_mobile/utils/app_text_styles/app_text_styles.dart';
import 'package:campuslink_mobile/utils/utils.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../res/components/attendance_button/attendance_button.dart';
import '../../../../res/components/custom_icon_button/custom_icon_button.dart';
import '../../../../res/components/search_bar/search_bar.dart';
import '../../../../utils/enums/enums.dart';

class TeacherAttendanceView extends StatefulWidget {
  const TeacherAttendanceView({super.key});

  @override
  State<TeacherAttendanceView> createState() => _TeacherAttendanceViewState();
}

class _TeacherAttendanceViewState extends State<TeacherAttendanceView> {
  final avm = Get.find<AttendanceViewModel>();
  final bvm = Get.find<BatchController>();
  final cvm = Get.find<CourseViewModel>();

  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      title: "Mark Attendance",
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: AppColor.primaryColor,
        foregroundColor: AppColor.whiteColor,
        hoverColor: AppColor.secondaryColor,
        onPressed: () async {
          avm.isLoading(true);
          if (avm.filteredStudentList.every((student) =>
              avm.input.attendanceStatus.containsKey(student.userId))) {
            try {
              await avm.markAttendance();
              avm.isLoading(false);

              Utils.showSnackBar(context, "Attendance marked successfully");
              print("Attendance marked successfully");
            } catch (e) {
              avm.isLoading(false);

              Utils.showSnackBar(
                context,
                "Failed to mark attendance",
              );
              print("Failed to mark attendance");
            }
          } else {
            avm.isLoading(false);

            Utils.showSnackBar(
              context,
              "All students must be marked",
            );
            print("All students must be marked");
          }
        },
        child: Obx(() => Center(
            child: avm.isLoading.value
                ? buildProgressIndicator()
                : const Icon(Icons.check))),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "${avm.input.batchId}(${bvm.getSemesterFromBatchId(avm.input.batchId.value)})",
            style: AppTextStyles.blackHeading1,
          ),
          subtitle: Text(
            "${cvm.getCourseNameById(avm.input.courseId.value)}",
            style: AppTextStyles.labelText,
          ),
          trailing: IconButton(
              onPressed: () async => Get.toNamed(RouteName.viewAttendanceView),
              icon: const Icon(
                Icons.view_list_rounded,
                color: AppColor.primaryColor,
                size: 40,
              )),
        ),
        SearchBar(
          onChanged: (value) {
            avm.searchStudents(value!);
          },
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Students",
              style: AppTextStyles.blackHeading2,
            ),
            Obx(
              () => CustomIconButton(
                onPressed: () async => avm.input.dateTime.value =
                    (await Utils. selectDate(context, avm.input.dateTime.value))!,
                label:
                    DateFormat('dd MMMM yyyy').format(avm.input.dateTime.value),
                icon: Icons.calendar_month_outlined,
              ),
            ),
            // Obx(
            //   () => Row(
            //     children: [

            //       Text(
            //         DateFormat('dd MMMM yyyy').format(avm.input.dateTime.value),
            //         style: AppTextStyles.secondaryHeading2,
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
        Expanded(
          child: Obx(
            () => ListView.builder(
              itemCount: avm.filteredStudentList.length,
              itemBuilder: (context, index) {
                final student = avm.filteredStudentList[index];
                return Obx(
                  () => Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColor.greyColor1,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: ListTile(
                      dense: true,
                      leading: Text(
                        "${index + 1}",
                        style: AppTextStyles.primaryHeading2,
                      ),
                      subtitle: Text(
                        "${avm.filteredStudentList[index].rollNo!}",
                        style: AppTextStyles.blackHeading1,
                      ),
                      title: Text(
                        avm.filteredStudentList[index].name!,
                        style: AppTextStyles.secondaryHeading1,
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AttendanceButton(
                              label: "P",
                              status:
                                  avm.input.attendanceStatus[student.userId],
                              value: AttendanceStatus.present,
                              onTap: (value) => avm.updateAttendanceStatus(
                                  student.userId!, value),
                              color: AppColor.greenColor1,
                            ),
                            AttendanceButton(
                              label: "A",
                              status:
                                  avm.input.attendanceStatus[student.userId],
                              value: AttendanceStatus.absent,
                              onTap: (value) => avm.updateAttendanceStatus(
                                  student.userId!, value),
                              color: AppColor.orangeColor1,
                            ),
                            AttendanceButton(
                              label: "L",
                              status:
                                  avm.input.attendanceStatus[student.userId],
                              value: AttendanceStatus.leave,
                              onTap: (value) => avm.updateAttendanceStatus(
                                  student.userId!, value),
                              color: AppColor.secondaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}
