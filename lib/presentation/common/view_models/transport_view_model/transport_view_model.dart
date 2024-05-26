import 'package:campuslink_mobile/data/models/transport_model/transport_model.dart';
import 'package:campuslink_mobile/services/firebase_services/firebase_transport_services/firebase_transport_services.dart';
import 'package:get/get.dart';

import '../../../../utils/week_days_manager/week_days_manager.dart';

class TransportViewModel extends GetxController {
  RxInt selectedIndex = 0.obs;
  final RxList<TransportModel> transportList = <TransportModel>[].obs;
  final RxList<TransportModel> filteredTransportList = <TransportModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getTransports();
    updateFilteredTransport();
    ever(selectedIndex, (_) => updateFilteredTransport());
  }

  Future<void> getTransports() async {
    transportList.value = await FirebaseTransportServices.getTransports();
  }

  void updateFilteredTransport() {
    final selectedDay = WeekDaysManager.days[selectedIndex.value];
    filteredTransportList.assignAll(transportList
        .where((transport) => transport.dayOfWeek == selectedDay)
        .toList());
  }
}
