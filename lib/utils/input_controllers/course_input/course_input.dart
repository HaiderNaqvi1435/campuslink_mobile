import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseInput {
  final RxString courseId="".obs;
  final codeController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final lecturesController = TextEditingController().obs;
  final labsController = TextEditingController().obs;
  final RxString deptValue = "".obs;

  dispose() {
    codeController.value.dispose();
    nameController.value.dispose();
    lecturesController.value.dispose();
    labsController.value.dispose();
  }

  clear() {
   courseId.value="";

    codeController.value.clear();
    nameController.value.clear();
    lecturesController.value.clear();
    labsController.value.clear();
    deptValue.value = "";
  }
}
