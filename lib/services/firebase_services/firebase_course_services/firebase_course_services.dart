import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/course_model/course_model.dart';

class FirebaseCourseServices {
  static Future<void> addCourse(CourseModel course) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('courses').doc();

      course.courseId = docRef.id;

      await docRef.set(course.toJson());

      if (kDebugMode) {
        print('Course added successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error adding course: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<List<CourseModel>> getCourses() async {
    List<CourseModel> coursesList = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('courses').get();

      coursesList = querySnapshot.docs
          .map(
              (doc) => CourseModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      print('Courses fetched successfully');
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error fetching course: ${e.code}');
        print(e.message);
      }
    }
    return coursesList;
  }

  static Future<void> deleteCourse(String courseId) async {
    try {
      await FirebaseFirestore.instance
          .collection('courses')
          .doc(courseId)
          .delete();
      print('Course deleted successfully');
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error deleting course: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<void> updateCourse(CourseModel course) async {
    try {
      await FirebaseFirestore.instance
          .collection('courses')
          .doc(course.courseId)
          .update(course.toJson());
      print('Course updated successfully');
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error updating course: ${e.code}');
        print(e.message);
      }
    }
  }
}
