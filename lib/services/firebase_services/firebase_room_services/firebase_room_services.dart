import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/models/room_model/room_model.dart';

class FirebaseRoomServices {
  static Future<void> addRoom(RoomModel room) async {
    try {
      await FirebaseFirestore.instance
          .collection('rooms')
          .doc(room.roomId)
          .set(room.toJson());
      print('Room added successfully');
    } on FirebaseException catch (e) {
      print('Error adding room: ${e.code}');
      print(e.message);
    }
  }

  static Future<List<RoomModel>> getRooms() async {
    List<RoomModel> roomsList = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('rooms').get();

      roomsList = querySnapshot.docs
          .map((doc) => RoomModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      print('Rooms fetched successfully');
    } on FirebaseException catch (e) {
      print('Error fetching rooms: ${e.code}');
      print(e.message);
    }
    return roomsList;
  }

  static Future<void> deleteRoom(String roomId) async {
    try {
      await FirebaseFirestore.instance.collection('rooms').doc(roomId).delete();
      print('Room deleted successfully');
    } on FirebaseException catch (e) {
      print('Error deleting room: ${e.code}');
      print(e.message);
    }
  }

  static Future<void> updateRoom(RoomModel room) async {
    try {
      await FirebaseFirestore.instance
          .collection('rooms')
          .doc(room.roomId)
          .update(room.toJson());
      print('Room updated successfully');
    } on FirebaseException catch (e) {
      print('Error updating room: ${e.code}');
      print(e.message);
    }
  }
}
