import 'package:campuslink_mobile/data/models/user_data_model/student_data_model/student_data_model.dart';
import 'package:campuslink_mobile/presentation/common/view_models/attendance_view_model/attendance_input_controller.dart';
import 'package:campuslink_mobile/services/firebase_services/firebase_student_services/firebase_student_services.dart';
import 'package:campuslink_mobile/utils/enums/enums.dart';
import 'package:campuslink_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:campuslink_mobile/data/models/attendance_model/attendance_model.dart';
import 'package:campuslink_mobile/presentation/common/view_models/controller/auth_controller/auth_controller.dart';
import 'package:intl/intl.dart';

import '../../../../services/firebase_services/firebase_attendance_services/firebase_attendance_services.dart';

class AttendanceViewModel extends GetxController {
  AttendanceInputController input = AttendanceInputController();
  final AuthController ac = Get.find<AuthController>();

  // final searchController = TextEditingController().obs;
  final RxBool isLoading = false.obs;
  final Rx<DateTime> attendanceDate = DateTime.now().obs;
  RxList<DateTime> dateList = <DateTime>[].obs;

  RxList<AttendanceModel> attendanceList = <AttendanceModel>[].obs;
  RxList<AttendanceModel> filteredAttendanceList = <AttendanceModel>[].obs;
  RxList<StudentDataModel> studentList = <StudentDataModel>[].obs;
  RxList<StudentDataModel> filteredStudentList = <StudentDataModel>[].obs;
  RxList<StudentDataModel> originalFilteredStudentList =
      <StudentDataModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getStudent();
  }

  getStudent() async {
    studentList.value = await FirebaseStudentServices.getstudents();
    filteredStudentList.assignAll(studentList);
  }

  filterStudentsByBatch(String batchId) {
    filteredStudentList.value = studentList
        .where((student) => student.batchId == batchId)
        .toList()
      ..sort((a, b) => a.rollNo!.compareTo(b.rollNo!)); // Sort by roll number
    originalFilteredStudentList
        .assignAll(filteredStudentList); // Save the batch-filtered list
  }

  void searchStudents(String query) {
    if (query.isEmpty) {
      filteredStudentList.assignAll(originalFilteredStudentList);
    } else {
      filteredStudentList.value = originalFilteredStudentList
          .where((student) =>
              student.name!.toLowerCase().contains(query.toLowerCase()) ||
              student.rollNo!
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    }
  }

  void updateAttendanceStatus(String studentId, AttendanceStatus status) {
    input.attendanceStatus[studentId] = status;
    input.attendanceStatus.refresh();
  }

  Future<void> markAttendance() async {
    for (var entry in input.attendanceStatus.entries) {
      final attendance = AttendanceModel(
        studentId: entry.key,
        teacherId: ac.teacherData.value.userId,
        courseId: input.courseId.value,
        status: entry.value,
        date: input.dateTime.value,
      );
      await FirebaseAttendanceService.markAttendance(
          attendance, input.batchId.value, input.courseId.value);
    }
    // Clear the attendance status after marking it
  }

  Future<void> getAttendanceByBatchAndCourse(BuildContext context) async {
    try {
      attendanceList.value =
          await FirebaseAttendanceService.getAttendanceByBatchAndCourse(
              input.batchId.value, input.courseId.value);
      filteredAttendanceList.value = attendanceList
          .where((attendance) =>
              DateFormat('dd MMMM yyyy').format(attendance.date!) ==
              DateFormat('dd MMMM yyyy').format(attendanceDate.value))
          .toList();
      filteredAttendanceList.sort((a, b) {
        final studentA = studentList.firstWhere((s) => s.userId == a.studentId);
        final studentB = studentList.firstWhere((s) => s.userId == b.studentId);
        return studentA.rollNo!.compareTo(studentB.rollNo!);
      });
      dateList.value = attendanceList
          .map((attendance) => attendance.date!)
          .toSet()
          .toList()
        ..sort((a, b) => b.day.compareTo(a.day));
    } catch (e) {
      Utils.showSnackBar(context, "Failed to fetch attendance data");
    }
  }

 

  filterAttendanceByDate() {
    filteredAttendanceList.value = attendanceList
        .where((attendance) =>
            DateFormat('dd MMMM yyyy').format(attendance.date!) ==
            DateFormat('dd MMMM yyyy').format(attendanceDate.value))
        .toList();
    filteredAttendanceList.sort((a, b) {
      final studentA = studentList.firstWhere((s) => s.userId == a.studentId);
      final studentB = studentList.firstWhere((s) => s.userId == b.studentId);
      return studentA.rollNo!.compareTo(studentB.rollNo!);
    });
  }
}
