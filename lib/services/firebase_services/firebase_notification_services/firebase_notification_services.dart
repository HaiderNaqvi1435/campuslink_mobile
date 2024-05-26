import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../../data/models/notification_model/notification_model.dart';

class FirebaseNotificationServices {
  static CollectionReference notificationsCollection =
      FirebaseFirestore.instance.collection('notifications');

  static Future<void> addNotification(NotificationModel notification) async {
    try {
      DocumentReference docRef = notificationsCollection.doc();
      notification.id = docRef.id;
      notification.dateTime = DateTime.now();

      await docRef.set(notification.toJson());

      if (kDebugMode) {
        print('Notification added successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error adding notification: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<List<NotificationModel>> getNotifications() async {
    List<NotificationModel> notificationsList = [];
    try {
      QuerySnapshot querySnapshot = await notificationsCollection.get();

      notificationsList = querySnapshot.docs
          .map((doc) =>
              NotificationModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      if (kDebugMode) {
        print('Notifications fetched successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error fetching notifications: ${e.code}');
        print(e.message);
      }
    }
    return notificationsList;
  }

  static Future<void> updateNotification(NotificationModel notification) async {
    try {
      await notificationsCollection
          .doc(notification.id)
          .update(notification.toJson());
      if (kDebugMode) {
        print('Notification updated successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error updating notification: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<void> deleteNotification(String notificationId) async {
    try {
      await notificationsCollection.doc(notificationId).delete();
      if (kDebugMode) {
        print('Notification deleted successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error deleting notification: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<List<NotificationModel>> getNotificationsByDepartmentId(
      String departmentId) async {
    List<NotificationModel> notificationsList = [];
    try {
      QuerySnapshot querySnapshot = await notificationsCollection
          .where('department_id', isEqualTo: departmentId)
          .get();

      notificationsList = querySnapshot.docs
          .map((doc) =>
              NotificationModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      if (kDebugMode) {
        print('Notifications fetched successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error fetching notifications: ${e.code}');
        print(e.message);
      }
    }
    return notificationsList;
  }
}
