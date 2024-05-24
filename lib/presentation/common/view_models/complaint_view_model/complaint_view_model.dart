import 'package:campuslink_mobile/data/models/complaint_model/complaint_model.dart';
import 'package:campuslink_mobile/services/firebase_services/firebase_complaint_services/firebase_complaint_services.dart';
import 'package:campuslink_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplaintViewModel extends GetxController {
  RxList<ComplaintModel> complaintList = <ComplaintModel>[].obs;
  RxList<ComplaintModel> filteredComplaints = <ComplaintModel>[].obs;
  final subjectController = TextEditingController().obs;
  final bodyController = TextEditingController().obs;
  final RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getComplaints();
  }

  getComplaints() async {
    complaintList.value =
        await FirebaseComplaintServices.getComplaintsByUserId();
    filteredComplaints.assignAll(complaintList);
  }

  void submitComplaint(BuildContext context) async {
    try {
      isLoading(true);

      if (subjectController.value.text.isEmpty ||
          bodyController.value.text.isEmpty) {
        Utils.showSnackBar(context, "Please provide subject and body");
        isLoading(false);

        return;
      }
      ComplaintModel complaint = ComplaintModel(
        title: subjectController.value.text.capitalize,
        body: bodyController.value.text,
      );
      await FirebaseComplaintServices.addComplaint(complaint);
      subjectController.value.clear();
      bodyController.value.clear();
      Utils.showSnackBar(context, "Complaint submitted");

      getComplaints();
      isLoading(false);
    } catch (e) {
      isLoading(false);
    }
  }
}
