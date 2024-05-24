import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../../data/models/department_model/department_model.dart';

class FirebaseDepartmentServices {
  static Future<void> addDepartment(DepartmentModel department) async {
    try {
      await FirebaseFirestore.instance
          .collection('departments')
          .doc(department.departmentId)
          .set(department.toJson());
      if (kDebugMode) {
        print('Department added successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error adding department: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<List<DepartmentModel>> getDepartments() async {
    List<DepartmentModel> departmentsList = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('departments').get();
      departmentsList = querySnapshot.docs
          .map((doc) =>
              DepartmentModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      if (kDebugMode) {
        print('Departments fetched successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error fetching departments: ${e.code}');
        print(e.message);
      }
    }
    return departmentsList;
  }

  static Future<void> deleteDepartment(String departmentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('departments')
          .doc(departmentId)
          .delete();
      if (kDebugMode) {
        print('Department deleted successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error deleting department: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<void> updateDepartment(DepartmentModel department) async {
    try {
      await FirebaseFirestore.instance
          .collection('departments')
          .doc(department.departmentId)
          .update(department.toJson());
      if (kDebugMode) {
        print('Department updated successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error updating department: ${e.code}');
        print(e.message);
      }
    }
  }
}
