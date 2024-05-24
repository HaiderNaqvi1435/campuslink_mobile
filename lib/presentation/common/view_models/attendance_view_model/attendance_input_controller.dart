import 'package:get/get.dart';

import '../../../../utils/enums/enums.dart';

class AttendanceInputController {
  RxMap<String, AttendanceStatus> attendanceStatus =
      <String, AttendanceStatus>{}.obs;
  RxString courseId = "".obs;
  RxString studentId = "".obs;
  RxString batchId = "".obs;
  Rx<DateTime> dateTime = DateTime.now().obs;

  void clear() {
    courseId.value = "";
    batchId.value = "";
    studentId.value = "";
    dateTime.value=DateTime.now();
    attendanceStatus.clear();
  }
}
