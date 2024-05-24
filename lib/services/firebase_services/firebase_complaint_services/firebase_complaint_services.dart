import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/complaint_model/complaint_model.dart';

class FirebaseComplaintServices {
  static CollectionReference complaintsCollection =
      FirebaseFirestore.instance.collection('complaints');

  static Future<void> addComplaint(ComplaintModel complaint) async {
    try {
      // Get current user UID
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw ('No user is currently signed in.');
      }
      complaint.dateTime = DateTime.now();
      complaint.complainantId = user.uid;
      // Create a document reference
      DocumentReference docRef = complaintsCollection.doc();
      complaint.id = docRef.id;

      // Add complaint to Firestore
      await docRef.set(complaint.toJson());

      if (kDebugMode) {
        print('Complaint added successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error adding complaint: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<List<ComplaintModel>> getComplaints() async {
    List<ComplaintModel> complaintsList = [];
    try {
      QuerySnapshot querySnapshot = await complaintsCollection.get();

      complaintsList = querySnapshot.docs
          .map((doc) =>
              ComplaintModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      if (kDebugMode) {
        print('Complaints fetched successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error fetching complaints: ${e.code}');
        print(e.message);
      }
    }
    return complaintsList;
  }
 static Future<List<ComplaintModel>> getComplaintsByUserId() async {
    List<ComplaintModel> complaintsList = [];
    try {
      // Get current user UID
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw ('No user is currently signed in.');
      }

      // Query Firestore for complaints by user ID
      QuerySnapshot querySnapshot = await complaintsCollection
          .where('complainant_id', isEqualTo: user.uid)
          .get();

      complaintsList = querySnapshot.docs
          .map((doc) => ComplaintModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      if (kDebugMode) {
        print('Complaints fetched successfully for user ${user.uid}');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error fetching complaints by user ID: ${e.code}');
        print(e.message);
      }
    }
    return complaintsList;
  }

  static Future<void> deleteComplaint(String complaintId) async {
    try {
      await complaintsCollection.doc(complaintId).delete();

      if (kDebugMode) {
        print('Complaint deleted successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error deleting complaint: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<void> updateComplaint(ComplaintModel complaint) async {
    try {
      await complaintsCollection.doc(complaint.id).update(complaint.toJson());

      if (kDebugMode) {
        print('Complaint updated successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error updating complaint: ${e.code}');
        print(e.message);
      }
    }
  }
}
