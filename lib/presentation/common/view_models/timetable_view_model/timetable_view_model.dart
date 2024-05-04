import 'package:get/get.dart';

import '../../../../data/models/time_table_model/time_table_model.dart';
import '../../../../data/repositories/sample_data/sample_data.dart';

class TimeTableViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Listen to changes in selectedIndex and update the schedule accordingly
    ever(selectedIndex, (_) => updateFilteredSchedule());
  }

  void updateFilteredSchedule() {
    filteredSchedule.assignAll(getStudentSchedule(selectedIndex.value));
  }

  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];
  RxInt selectedIndex = 0.obs;
  final sampleData = SampleData();
  RxList filteredSchedule = <TimeTableModel>[].obs;

  List<TimeTableModel> getStudentSchedule(int selectedIndex) {
    return sampleData.listOfTimeTable
        .where((item) =>
            item.dayOfWeek == days[selectedIndex] &&
            item.batchId == sampleData.currentUserStudent.batchId)
        .toList();
  }

  List<TimeTableModel> getTeacherSchedule(int selectedIndex) {
    return sampleData.listOfTimeTable
        .where((item) =>
            item.dayOfWeek == days[selectedIndex] &&
            item.teacherId == sampleData.currentUserTeacher.userId)
        .toList();
  }
}
