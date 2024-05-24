import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/models/user_data_model/student_data_model/student_data_model.dart';

class FirebaseStudentServices {
 static Future<List<StudentDataModel>> getstudents() async {
    List<StudentDataModel> studentsList = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('students').get();

      studentsList = querySnapshot.docs
          .map((doc) =>
              StudentDataModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      print('students fetched successfully');
    } on FirebaseException catch (e) {
      print('Error fetching students: ${e.code}');
      print(e.message);
    }
    return studentsList;
  }

  static Future<List<StudentDataModel>> getStudentsByBatch(String batchId) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('students').where('batch_id', isEqualTo: batchId).get();
      return querySnapshot.docs.map((doc) => StudentDataModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      rethrow;
    }
  }
 static Future<void> deleteStudent(String studentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('students')
          .doc(studentId)
          .delete();
      print('student deleted successfully');
      // Assuming you have a studentsList RxList in your controller
    } on FirebaseException catch (e) {
      print('Error deleting student: ${e.code}');
      print(e.message);
    }
  }

 static Future<void> updateStudent(StudentDataModel student) async {
    try {
      await FirebaseFirestore.instance
          .collection('students')
          .doc(student.userId)
          .update(student.toJson());
      print('student updated successfully');
      // Assuming you have a studentsList RxList in your controller
    } on FirebaseException catch (e) {
      print('Error updating student: ${e.code}');
      print(e.message);
    }
  }
}
