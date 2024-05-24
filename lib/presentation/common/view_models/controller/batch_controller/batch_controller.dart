import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/batch_model/batch_model.dart';
import '../../../../../services/firebase_services/firebase_batch_services/firebase_batch_services.dart';

class BatchController extends GetxController {
  RxList<BatchModel> batchesList = <BatchModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    loadBatches();
  }

  Future<void> loadBatches() async {
    try {
      batchesList.value = await FirebaseBatchServices.getBatches();
    } finally {}
  }

  String getSemesterFromBatchId(String batchId) {
    return batchesList
        .firstWhere(
          (batch) => batch.batchId == batchId,
        )
        .semester!;
  }

  List<DropdownMenuItem<String>>? getBatchDropdownItems() => batchesList
      .map((batch) => DropdownMenuItem(
            value: batch.batchId,
            child: Text(
                "${batch.batchId} (${getSemesterFromBatchId(batch.batchId!)})"),
          ))
      .toList();
}
