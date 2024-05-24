import 'package:get/get.dart';

import '../../../../../data/models/room_model/room_model.dart';
import '../../../../../services/firebase_services/firebase_room_services/firebase_room_services.dart';

class RoomController extends GetxController {
  RxList<RoomModel> roomsList = <RoomModel>[].obs;

  @override
  void onInit() async {
    roomsList.value = await FirebaseRoomServices.getRooms();
    super.onInit();
  }

  
    String getBlockById(String roomId) {
    final room = roomsList.firstWhereOrNull((room) => room.roomId == roomId);
    return room?.block ?? 'N/A';
  }
   String getRoomNoById(String roomId) {
    final room = roomsList.firstWhereOrNull((room) => room.roomId == roomId);
    return room?.roomNo ?? 'N/A';
  }
}
