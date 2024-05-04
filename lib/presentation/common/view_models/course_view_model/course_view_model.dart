import 'package:campuslink_mobile/data/models/batch_model/batch_model.dart';
import 'package:campuslink_mobile/data/models/course_model/course_model.dart';
import 'package:campuslink_mobile/data/models/user_data_model/teacher_data_model/teacher_data_model.dart';
import 'package:get/get.dart';

import '../../../../data/models/time_table_model/time_table_model.dart';
import '../../../../data/repositories/sample_data/sample_data.dart';
import '../controller/auth_controller/auth_controller.dart';

class CourseViewModel extends GetxController {
  final sampleData = SampleData();
  RxList filteredSchedule = [].obs;
  final avm = Get.put(AuthController());

  @override
  void onInit() {
    super.onInit();
    if (avm.isTeacher==true) {
      filteredSchedule.assignAll(getTeacherSchedule());
    } else {
      filteredSchedule.assignAll(getStudentSchedule());
    }
  }

  List<TimeTableModel> getTeacherSchedule() {
    return sampleData.listOfTimeTable
        .where((item) => item.teacherId == sampleData.currentUserTeacher.userId)
        .toList();
  }

  List<TimeTableModel> getStudentSchedule() {
    return sampleData.listOfTimeTable
        .where((item) => item.batchId == sampleData.currentUserStudent.batchId)
        .toList();
  }

  CourseModel getIndexedCourses(int index) {
    return sampleData.listOfCourses.firstWhere(
        (element) => element.courseCode == filteredSchedule[index].courseCode);
  }

  BatchModel getIndexedBatch(int index) {
    return sampleData.listOfBatches.firstWhere(
        (element) => element.batchId == filteredSchedule[index].batchId);
  }
 
  TeacherDataModel getIndexedTeacher(int index) {
    return sampleData.listOfTeachers.firstWhere(
      (element) => element.userId == filteredSchedule[index].teacherId,
    );
  }
}
