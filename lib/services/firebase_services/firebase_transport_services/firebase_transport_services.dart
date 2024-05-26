


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../../data/models/transport_model/transport_model.dart';

class FirebaseTransportServices {
  static final CollectionReference transportCollection =
      FirebaseFirestore.instance.collection('transports');

  static Future<void> addTransport(TransportModel transport) async {
    try {
      DocumentReference docRef = transportCollection.doc();
    
      transport.id = docRef.id;

      await docRef.set(transport.toJson());

      if (kDebugMode) {
        print('Transport added successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error adding transport: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<List<TransportModel>> getTransports() async {
    List<TransportModel> transportList = [];
    try {
      QuerySnapshot querySnapshot = await transportCollection.get();
      transportList = querySnapshot.docs
          .map((doc) =>
              TransportModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      if (kDebugMode) {
        print('Transports fetched successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error fetching transports: ${e.code}');
        print(e.message);
      }
    }
    return transportList;
  }

  static Future<void> deleteTransport(String id) async {
    try {
      await transportCollection.doc(id).delete();
      if (kDebugMode) {
        print('Transport deleted successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error deleting transport: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<void> updateTransport(TransportModel transport) async {
    try {
      await transportCollection.doc(transport.id).update(transport.toJson());
      if (kDebugMode) {
        print('Transport updated successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error updating transport: ${e.code}');
        print(e.message);
      }
    }
  }
}