class RoomModel {
  String? roomId;
  String? roomNo;
  String? capacity;
  String? block;
  bool? islab;

  RoomModel({ this.roomId,this.roomNo, this.capacity, this.block, this.islab});

  RoomModel.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    roomNo = json['room_no'];
    capacity = json['capacity'];
    block = json['block'];
    islab = json['islab'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['room_id'] = roomId;
    data['room_no'] = roomNo;
    data['capacity'] = capacity;
    data['block'] = block;
    data['islab'] = islab;
    return data;
  }
}