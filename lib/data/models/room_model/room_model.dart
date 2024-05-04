class RoomModel {
  int? roomId;
  int? capacity;
  String? block;
  bool? islab;

  RoomModel({this.roomId, this.capacity, this.block, this.islab});

  RoomModel.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    capacity = json['capacity'];
    block = json['block'];
    islab = json['islab'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['room_id'] = roomId;
    data['capacity'] = capacity;
    data['block'] = block;
    data['islab'] = islab;
    return data;
  }
}