import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/timetable_model/timetable_model.dart';

class FirebaseScheduleServices {
  static Future<void> addSchedule(TimeTableModel schedule) async {
    try {
      // Generate a new document reference with an auto-generated ID
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('schedules').doc();

      // Assign the generated document ID as the slot ID
      schedule.slotId = docRef.id;

      // Use the document reference to set the data, which includes the slot ID
      await docRef.set(schedule.toJson());

      if (kDebugMode) {
        print('Schedule added successfully with slot ID: ${schedule.slotId}');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error adding schedule: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<List<TimeTableModel>> getSchedules() async {
    List<TimeTableModel> schedulesList = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('schedules').get();

      schedulesList = querySnapshot.docs
          .map((doc) =>
              TimeTableModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      if (kDebugMode) {
        print('Schedules fetched successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error fetching schedules: ${e.code}');
        print(e.message);
      }
    }
    return schedulesList;
  }

  static Future<void> deleteSchedule(String slotId) async {
    try {
      await FirebaseFirestore.instance
          .collection('schedules')
          .doc(slotId)
          .delete();
      if (kDebugMode) {
        print('Schedule deleted successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error deleting schedule: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<void> updateSchedule(TimeTableModel schedule) async {
    try {
      await FirebaseFirestore.instance
          .collection('schedules')
          .doc(schedule.slotId)
          .update(schedule.toJson());
      if (kDebugMode) {
        print('Schedule updated successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error updating schedule: ${e.code}');
        print(e.message);
      }
    }
  }
}
