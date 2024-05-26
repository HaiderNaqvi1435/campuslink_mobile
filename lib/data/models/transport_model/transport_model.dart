import 'package:cloud_firestore/cloud_firestore.dart';

class TransportModel {
  String? id;
  String? busId;
  String? driverName;
  String? source;
  String? destination;
  DateTime? departureTime;
  DateTime? arrivalTime;
  String? dayOfWeek;

  TransportModel(
      {this.id,
      this.busId,
      this.driverName,
      this.source,
      this.destination,
      this.departureTime,
      this.arrivalTime,
      this.dayOfWeek});

  TransportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    busId = json['bus_id'];
    driverName = json['driver_name'];
    arrivalTime = (json['arrival_time'] as Timestamp).toDate();
    departureTime = (json['departure_time'] as Timestamp).toDate();
    source = json['source'];
    destination = json['destination'];
    dayOfWeek = json['day_of_week'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bus_id'] = busId;
    data['driver_name'] = driverName;
    data['source'] = source;
    data['destination'] = destination;
    data['departure_time'] = departureTime;
    data['arrival_time'] = arrivalTime;
    data['day_of_week'] = dayOfWeek;
    return data;
  }
}
