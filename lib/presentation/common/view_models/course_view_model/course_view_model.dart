import 'package:get/get.dart';

import '../../../../data/models/course_model/course_model.dart';
import '../../../../services/firebase_services/firebase_course_services/firebase_course_services.dart';

class CourseViewModel extends GetxController {
  RxList<CourseModel> coursesList = <CourseModel>[].obs;

  @override
  void onInit() async {
    coursesList.value = await FirebaseCourseServices.getCourses();
    super.onInit();
  }



  String? getCourseNameById(String courseId) {
    // Find the course with the matching course code
    final course = coursesList.firstWhereOrNull(
      (course) => course.courseId == courseId,
    );

    // Check if a course is found and return the course name, otherwise return "No course found"
    return course != null
        ? course.courseName
        : "N/A";
  }

  String? getCourseCodeById(String courseId) {
    // Find the course with the matching course code
    final course = coursesList.firstWhereOrNull(
      (course) => course.courseId == courseId,
    );

    // Check if a course is found and return the course name, otherwise return "No course found"
    return course != null ? course.courseCode : "N/A";
  }

  String? getCreditByCode(String courseId) {
    // Find the course with the matching course code
    final course = coursesList.firstWhereOrNull(
      (course) => course.courseId == courseId,
    );

    // Check if a course is found and return the course name, otherwise return "No course found"
    return "${course!.totalLectures! + course.totalLabs!}(${course.totalLectures}-${course.totalLabs})";
  }
  // @override
  // void onInit() {
  //   super.onInit();
  //   if (avm.isTeacher==true) {
  //     filteredSchedule.assignAll(getTeacherSchedule());
  //   } else {
  //     filteredSchedule.assignAll(getStudentSchedule());
  //   }
  // }

  // List<TimeTableModel> getTeacherSchedule() {
  //   return sampleData.listOfTimeTable
  //       .where((item) => item.teacherId == sampleData.currentUserTeacher.userId)
  //       .toList();
  // }

  // List<TimeTableModel> getStudentSchedule() {
  //   return sampleData.listOfTimeTable
  //       .where((item) => item.batchId == sampleData.currentUserStudent.batchId)
  //       .toList();
  // }

  // CourseModel getIndexedCourses(int index) {
  //   return sampleData.listOfCourses.firstWhere(
  //       (element) => element.courseCode == filteredSchedule[index].courseCode);
  // }

  // BatchModel getIndexedBatch(int index) {
  //   return sampleData.listOfBatches.firstWhere(
  //       (element) => element.batchId == filteredSchedule[index].batchId);
  // }

  // TeacherDataModel getIndexedTeacher(int index) {
  //   return sampleData.listOfTeachers.firstWhere(
  //     (element) => element.userId == filteredSchedule[index].teacherId,
  //   );
  // }
}
