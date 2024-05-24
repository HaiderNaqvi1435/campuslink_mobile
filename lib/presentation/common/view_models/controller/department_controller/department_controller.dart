import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/department_model/department_model.dart';
import '../../../../../services/firebase_services/firebase_department_services/firebase_department_services.dart';

class DepartmentController extends GetxController {
  RxList<DepartmentModel> departmentsList = <DepartmentModel>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    loadDepartments();
  }

  Future<void> loadDepartments() async {
    try {
      departmentsList.value = await FirebaseDepartmentServices.getDepartments();
    } finally {
    }
  }



  List<DropdownMenuItem<String>>? getDeptDropdownItems() {
    return departmentsList
        .map((dept) => DropdownMenuItem(
              value: dept.departmentId,
              child: Text(dept.departmentId ?? 'N/A'),
            ))
        .toList();
  }
}
