import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../enums/enums.dart';

class BatchInput {
  final RxString deptValue = "".obs;
  final Rx<SessionType> typeValue = SessionType.morning.obs;
  final semesterController = TextEditingController().obs;
  final updateSemesterController = TextEditingController().obs;
  final programController = TextEditingController().obs;
  final sessionController = TextEditingController().obs;

  dispose() {
    semesterController.value.dispose();
    sessionController.value.dispose();
    updateSemesterController.value.dispose();
    programController.value.dispose();
  }

  clear() {
    semesterController.value.clear();
    sessionController.value.clear();
    updateSemesterController.value.clear();
    programController.value.clear();
    deptValue.value = "";
    typeValue.value = SessionType.morning;
  }
}
