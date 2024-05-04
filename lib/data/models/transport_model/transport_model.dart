class TransportModel {
  String? busId;
  String? driverName;
  String? departureTime;
  String? arrivalTime;
  String? dayOfWeek;

  TransportModel(
      {this.busId,
      this.driverName,
      this.departureTime,
      this.arrivalTime,
      this.dayOfWeek});

  TransportModel.fromJson(Map<String, dynamic> json) {
    busId = json['bus_id'];
    driverName = json['driver_name'];
    departureTime = json['departure_time'];
    arrivalTime = json['arrival_time'];
    dayOfWeek = json['day_of_week'];
  }
 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bus_id'] = busId;
    data['driver_name'] = driverName;
    data['departure_time'] = departureTime;
    data['arrival_time'] = arrivalTime;
    data['day_of_week'] = dayOfWeek;
    return data;
  }
}
