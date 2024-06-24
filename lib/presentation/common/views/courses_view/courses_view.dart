import 'package:campuslink_mobile/presentation/common/view_models/controller/faculty_controller/faculty_controller.dart';
import 'package:campuslink_mobile/presentation/common/view_models/course_view_model/course_view_model.dart';
import 'package:campuslink_mobile/presentation/student_features/view_models/student_attendance_view_model/student_attendance_view_model.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/assets/icon_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/routes/routes_name.dart';
import '../../view_models/attendance_view_model/attendance_view_model.dart';
import '../../view_models/controller/auth_controller/auth_controller.dart';
import '../../view_models/controller/batch_controller/batch_controller.dart';
import '../../view_models/timetable_view_model/timetable_view_model.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {

  final tvm = Get.find<TimeTableViewModel>();
  final bvm = Get.find<BatchController>();
  final fvm = Get.find<FacultyController>();
  final cvm = Get.find<CourseViewModel>();
  final avm = Get.put(AttendanceViewModel());
  final savm = Get.put(StudentAttendanceViewModel());
  final ac = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      title: "courses",
      child: Obx(
        () => ListView.builder(
          itemCount: tvm.userCourses.length,
          itemBuilder: (context, index) {
            return Card(
              color: AppColor.whiteColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: AppColor.hintColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Image.asset(IconAssets.booksIcon),
                title: Text(
                  "${cvm.getCourseNameById(tvm.userCourses[index].courseId!)}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${cvm.getCourseCodeById(tvm.userCourses[index].courseId!)}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColor.labelColor,
                      ),
                    ),
                    Text(
                      tvm.isTeacher.value
                          ? "${tvm.userCourses[index].batchId} (${bvm.getSemesterFromBatchId(tvm.userCourses[index].batchId!)})"
                          : "Prof. ${fvm.getTeacherNameById(tvm.userCourses[index].teacherId!)}",
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColor.labelColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${cvm.getCreditByCode(tvm.userCourses[index].courseId!)}",
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColor.labelColor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (tvm.isTeacher.value) {
                              avm.input.clear();
                              // Navigate to attendance marking page
                              avm.filterStudentsByBatch(
                                  tvm.userCourses[index].batchId!);
                              avm.input.courseId.value =
                                  tvm.userCourses[index].courseId!;
                              avm.input.batchId.value =
                                  tvm.userCourses[index].batchId!;
                              avm.input.dateTime.value = DateTime.now();

                              Get.toNamed(RouteName.teacherAttendanceView);
                            } else {
                              savm.input.courseId.value =
                                  tvm.userCourses[index].courseId!;
                              savm.input.batchId.value =
                                  tvm.userCourses[index].batchId!;
                              savm.input.studentId.value =
                                  ac.studentData.value.userId!;
                              // Navigate to attendance viewing page
                              Get.toNamed(RouteName.studentAttendanceView);
                            }
                          },
                          child: Container(
                            height: 30,
                            width: 110,
                            decoration: BoxDecoration(
                              color: AppColor.primaryButtonColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                "Attendance",
                                style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
