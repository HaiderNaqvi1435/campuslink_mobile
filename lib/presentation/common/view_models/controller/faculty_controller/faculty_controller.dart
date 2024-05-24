import 'package:get/get.dart';

import '../../../../../data/models/user_data_model/teacher_data_model/teacher_data_model.dart';
import '../../../../../services/firebase_services/firebase_faculty_services/firebase_faculty_services.dart';

class FacultyController extends GetxController {
  RxList<TeacherDataModel> facultyList = <TeacherDataModel>[].obs;
  @override
  void onInit() async {
    super.onInit();
    facultyList.value = await FirebaseFacultyServices.getTeachers();
  }

  String getTeacherNameById(String userId) {
    final teacher = facultyList.firstWhere(
      (teacher) => teacher.userId == userId,
    );
    return teacher.name!;
  }

  String getTeacherDeptById(String userId) {
    final teacher = facultyList.firstWhere(
      (teacher) => teacher.userId == userId,
    );
    return teacher.departmentId!;
  }
}
