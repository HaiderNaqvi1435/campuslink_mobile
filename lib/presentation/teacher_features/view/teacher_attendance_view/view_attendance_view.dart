import 'package:campuslink_mobile/res/components/custom_icon_button/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../theme/app_theme_wiget/app_theme_wiget.dart';
import '../../../../utils/app_text_styles/app_text_styles.dart';
import '../../../../utils/enums/enums.dart';
import '../../../common/view_models/attendance_view_model/attendance_view_model.dart';
import 'widgets/show_custom_date_picker.dart';

class ViewAttendanceView extends StatefulWidget {
  const ViewAttendanceView({super.key});

  @override
  State<ViewAttendanceView> createState() => _ViewAttendanceViewState();
}

class _ViewAttendanceViewState extends State<ViewAttendanceView> {
  final avm = Get.find<AttendanceViewModel>();
  @override
  void initState() {
    avm.getAttendanceByBatchAndCourse(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      title: "Attendance Records",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Attendance",
                style: AppTextStyles.blackHeading2,
              ),
              Obx(
                () => CustomIconButton(
                    onPressed: () async {
                      showCustomDatePicker(context);
                      // avm.attendanceDate.value = (await selectDate(
                      //     context, avm.attendanceDate.value))!;
                    },
                    label: DateFormat('dd MMMM yyyy')
                        .format(avm.attendanceDate.value),
                    icon: Icons.calendar_month_outlined),
              )
            ],
          ),
          Expanded(
            child: Obx(() {
              if (avm.filteredAttendanceList.isEmpty) {
                return const Center(
                  child: Text(
                    "No attendance records found",
                    style: AppTextStyles.primaryHeading1,
                  ),
                );
              }

              return ListView.builder(
                itemCount: avm.filteredAttendanceList.length,
                itemBuilder: (context, index) {
                  final attendance = avm.filteredAttendanceList[index];
                  final student = avm.studentList
                      .firstWhere((s) => s.userId == attendance.studentId);

                  return ListTile(
                    dense: true,
                    leading: Text(
                      "${index + 1}",
                      style: AppTextStyles.primaryHeading2,
                    ),
                    title: Text(
                      student.name!,
                      style: AppTextStyles.secondaryHeading1,
                    ),
                    // title:
                    //     Text(student.name!, style: AppTextStyles.blackHeading1),
                    // subtitle: Text(
                    //   "Date: ${DateFormat('dd MMMM yyyy').format(attendance.date!)}",
                    //   style: AppTextStyles.blackNormalText,
                    // ),
                    subtitle: Text(
                      "${student.rollNo!}",
                      style: AppTextStyles.blackHeading1,
                    ),
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
