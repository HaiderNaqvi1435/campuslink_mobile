import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/batch_model/batch_model.dart';

class FirebaseBatchServices {
  static Future<void> addBatch(BatchModel batch) async {
    try {
      await FirebaseFirestore.instance
          .collection('batches')
          .doc(batch.batchId)
          .set(batch.toJson());
      if (kDebugMode) {
        print('Batch added successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error adding batch: ${e.code}');
        print(e.message);
      }
    }
  }

 static Future<List<BatchModel>> getBatches() async {
    List<BatchModel> batchesList = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('batches').get();

      batchesList = querySnapshot.docs
          .map((doc) => BatchModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      if (kDebugMode) {
        print('Batches fetched successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error fetching batches: ${e.code}');
        print(e.message);
      }
    }
    return batchesList;
  }

 static Future<void> deleteBatch(String batchId) async {
    try {
      await FirebaseFirestore.instance
          .collection('batches')
          .doc(batchId)
          .delete();
      if (kDebugMode) {
        print('Batch deleted successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error deleting batch: ${e.code}');
        print(e.message);
      }
    }
  }

 static Future<void> updateBatch(BatchModel batch) async {
    try {
      await FirebaseFirestore.instance
          .collection('batches')
          .doc(batch.batchId)
          .update(batch.toJson());
      if (kDebugMode) {
        print('Batch updated successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error updating batch: ${e.code}');
        print(e.message);
      }
    }
  }
}
