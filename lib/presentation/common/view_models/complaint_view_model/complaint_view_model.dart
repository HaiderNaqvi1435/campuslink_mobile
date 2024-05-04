import 'package:campuslink_mobile/data/models/complaint_model/complaint_model.dart';
import 'package:campuslink_mobile/data/repositories/sample_data/sample_data.dart';
import 'package:get/get.dart';

class ComplaintViewModel extends GetxController {
  SampleData sampleData = SampleData();
  RxList filteredComplaints = <ComplaintModel>[].obs;

  @override
  void onInit() {
    filteredComplaints.assignAll(sampleData.listOfComplaint);
    super.onInit();
  }
}
