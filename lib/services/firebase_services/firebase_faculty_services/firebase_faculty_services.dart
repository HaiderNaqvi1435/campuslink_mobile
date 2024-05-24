import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/user_data_model/teacher_data_model/teacher_data_model.dart';

class FirebaseFacultyServices {
static  Future<List<TeacherDataModel>> getTeachers() async {
    List<TeacherDataModel> facultyList = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('teachers').get();

      facultyList = querySnapshot.docs
          .map((doc) =>
              TeacherDataModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      if (kDebugMode) {
        print('Teachers fetched successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error fetching teachers: ${e.code}');
        print(e.message);
      }
    }
    return facultyList;
  }

static  Future<void> deleteTeacher(String teacherId) async {
    try {
      await FirebaseFirestore.instance
          .collection('teachers')
          .doc(teacherId)
          .delete();
      if (kDebugMode) {
        print('Teacher deleted successfully');
      }
      // Assuming you have a facultyList RxList in your controller
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error deleting teacher: ${e.code}');
        print(e.message);
      }
    }
  }

static  Future<void> updateTeacher(TeacherDataModel teacher) async {
    try {
      await FirebaseFirestore.instance
          .collection('teachers')
          .doc(teacher.userId)
          .update(teacher.toJson());
      print('Teacher updated successfully');
      // Assuming you have a facultyList RxList in your controller
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error updating teacher: ${e.code}');
        print(e.message);
      }
    }
  }
}
