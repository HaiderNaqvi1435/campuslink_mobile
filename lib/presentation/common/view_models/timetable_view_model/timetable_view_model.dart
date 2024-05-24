import 'package:campuslink_mobile/presentation/common/view_models/controller/auth_controller/auth_controller.dart';
import 'package:campuslink_mobile/services/firebase_services/firebase_schedule_services/firebase_schedule_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/models/timetable_model/timetable_model.dart';

class TimeTableViewModel extends GetxController {

  RxList<TimeTableModel> filteredScheduleList = <TimeTableModel>[].obs;
  RxList<TimeTableModel> scheduleList = <TimeTableModel>[].obs;
  RxList<TimeTableModel> userCourses = <TimeTableModel>[].obs;

  RxInt selectedIndex = 0.obs;
  final ac = Get.find<AuthController>();
  final RxBool isTeacher = false.obs;
  final RxList<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ].obs;
  @override
  void onInit() async {
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isTeacher.value = prefs.getBool('isTeacher') ?? false;
    scheduleList.value = await FirebaseScheduleServices.getSchedules();
    if (isTeacher.value) {
      updateTeacherFilteredSchedule();
    } else {
      updateStudentFilteredSchedule();
    }
    await getUserCourses();

    ever(
        selectedIndex,
        (_) => isTeacher.value
            ? updateTeacherFilteredSchedule()
            : updateStudentFilteredSchedule());
  }
  Future<void> getUserCourses() async {
    print("Fetching user courses...");
    Set<String> uniqueKeys =
        {}; // Track unique combinations of batchId, courseCode, and teacherId
    List<TimeTableModel> uniqueCourses = [];

    if (isTeacher.value) {
      for (var course in scheduleList) {
        String key = "${course.batchId}_${course.courseId}_${course.teacherId}";
        if (course.teacherId == ac.teacherData!.userId! &&
            !uniqueKeys.contains(key)) {
          uniqueKeys.add(key);
          uniqueCourses.add(course);
        }
      }
    } else {
      for (var course in scheduleList) {
        String key = "${course.batchId}_${course.courseId}_${course.teacherId}";
        if (course.batchId == ac.studentData!.batchId! &&
            !uniqueKeys.contains(key)) {
          uniqueKeys.add(key);
          uniqueCourses.add(course);
        }
      }
    }

    userCourses.assignAll(uniqueCourses);
    print("User courses updated: ${userCourses.length} courses found.");
  }
  // void updateFilteredSchedule() {
  //   filteredScheduleList.assignAll(scheduleList);
  // }
  void updateStudentFilteredSchedule() {
    final selectedDay = days[selectedIndex.value];
    filteredScheduleList.assignAll(scheduleList
        .where((schedule) =>
            schedule.dayOfWeek == selectedDay &&
            schedule.batchId == ac.studentData!.batchId)
        .toList());
  }

  void updateTeacherFilteredSchedule() {
    final selectedDay = days[selectedIndex.value];
    filteredScheduleList.assignAll(scheduleList
        .where((schedule) =>
            schedule.dayOfWeek == selectedDay &&
            schedule.teacherId == ac.teacherData!.userId)
        .toList());
  }
}
  
//   final sampleData = SampleData();

//   List<TimeTableModel> getStudentSchedule(int selectedIndex) {
//     return sampleData.listOfTimeTable
//         .where((item) =>
//             item.dayOfWeek == days[selectedIndex] &&
//             item.batchId == sampleData.currentUserStudent.batchId)
//         .toList();
//   }

//   List<TimeTableModel> getTeacherSchedule(int selectedIndex) {
//     return sampleData.listOfTimeTable
//         .where((item) =>
//             item.dayOfWeek == days[selectedIndex] &&
//             item.teacherId == sampleData.currentUserTeacher.userId)
//         .toList();
//   }
// }
