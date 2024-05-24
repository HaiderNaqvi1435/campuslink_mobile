import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:campuslink_mobile/data/models/attendance_model/attendance_model.dart';

class FirebaseAttendanceService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> markAttendance(AttendanceModel attendance, String batchId, String courseId) async {
    try {
      CollectionReference attendanceCollection = 
          _firestore.collection('attendances').doc(batchId).collection(courseId);
      await attendanceCollection.add(attendance.toJson());
    } catch (e) {
      print("Error marking attendance: $e");
      rethrow;
    }
  }

  static Future<List<AttendanceModel>> getAttendanceByCourse(String batchId, String courseId) async {
    try {
      CollectionReference attendanceCollection = 
          _firestore.collection('attendances').doc(batchId).collection(courseId);
      QuerySnapshot querySnapshot = await attendanceCollection.get();
      return querySnapshot.docs
          .map((doc) => AttendanceModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error getting attendance by course: $e");
      rethrow;
    }
  }

  static Future<List<AttendanceModel>> getAttendanceByStudent(String batchId, String courseId, String studentId) async {
    try {
      CollectionReference attendanceCollection = 
          _firestore.collection('attendances').doc(batchId).collection(courseId);
      QuerySnapshot querySnapshot = await attendanceCollection
          .where('student_id', isEqualTo: studentId)
          .get();
      return querySnapshot.docs
          .map((doc) => AttendanceModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error getting attendance by student: $e");
      rethrow;
    }
  }

  static Future<List<AttendanceModel>> getAttendanceByTeacher(String batchId, String courseId, String teacherId) async {
    try {
      CollectionReference attendanceCollection = 
          _firestore.collection('attendances').doc(batchId).collection(courseId);
      QuerySnapshot querySnapshot = await attendanceCollection
          .where('teacher_Id', isEqualTo: teacherId)
          .get();
      return querySnapshot.docs
          .map((doc) => AttendanceModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error getting attendance by teacher: $e");
      rethrow;
    }
  }

  static Future<List<AttendanceModel>> getAttendanceByBatchAndCourse(String batchId, String courseId) async {
    try {
      CollectionReference attendanceCollection = 
          _firestore.collection('attendances').doc(batchId).collection(courseId);
      QuerySnapshot querySnapshot = await attendanceCollection.get();
      return querySnapshot.docs
          .map((doc) => AttendanceModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error getting attendance by batch and course: $e");
      rethrow;
    }
  }
}