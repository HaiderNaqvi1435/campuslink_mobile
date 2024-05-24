import 'package:campuslink_mobile/utils/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/attendance_model/attendance_model.dart';
import '../../../../services/firebase_services/firebase_attendance_services/firebase_attendance_services.dart';
import '../../../../utils/utils.dart';
import '../../../common/view_models/attendance_view_model/attendance_input_controller.dart';

class StudentAttendanceViewModel extends GetxController {
  final RxList<AttendanceModel> studentCourseAttendance =
      <AttendanceModel>[].obs;
  final AttendanceInputController input = AttendanceInputController();
  final RxBool isLoading = false.obs;
  final RxInt totalAttendance = 0.obs;
  final RxInt totalAbsents = 0.obs;
  final RxInt totalLeaves = 0.obs;
  final RxInt totalPresents = 0.obs;
  final RxDouble percentage = 0.0.obs;

  Future<void> getAttendanceByStudent(BuildContext context) async {
    try {
      isLoading(true);
      clear();
      studentCourseAttendance.value =
          await FirebaseAttendanceService.getAttendanceByStudent(
        input.batchId.value,
        input.courseId.value,
        input.studentId.value,
      );
      getTotalAttendance();
      getTotalAbsents();
      getTotalLeaves();
      getTotalPresents();
      calculateAttendance();
      studentCourseAttendance.sort(
        (a, b) => b.date!.day.compareTo(a.date!.day),
      );
      isLoading(false);
    } catch (e) {
      isLoading(false);

      Utils.showSnackBar(context, "Failed to fetch attendance data");
    }
  }

  getTotalAttendance() {
    totalAttendance.value = studentCourseAttendance.length;
    print(totalAttendance);
  }

  getTotalAbsents() {
    totalAbsents.value = studentCourseAttendance
        .where((attendance) => attendance.status == AttendanceStatus.absent)
        .length;
    print(totalAbsents);
  }

  getTotalLeaves() {
    totalLeaves.value = studentCourseAttendance
        .where((attendance) => attendance.status == AttendanceStatus.leave)
        .length;
    print(totalLeaves);
  }

  getTotalPresents() {
    totalPresents.value = studentCourseAttendance
        .where((attendance) => attendance.status == AttendanceStatus.present)
        .length;
    print(totalPresents);
  }

  calculateAttendance() {
    percentage.value =
        ((totalPresents.value + totalLeaves.value) / totalAttendance.value) *
            100;
    print(percentage);
  }

  clear() {
    totalAttendance.value = 0;
    totalAbsents.value = 0;
    totalLeaves.value = 0;
    totalPresents.value = 0;
    percentage.value = 0;
  }
}
