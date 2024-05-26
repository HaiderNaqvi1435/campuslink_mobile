import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/enums/enums.dart';

class NotificationModel {
  String? id;
  String? title;
  String? body;
  Audience? audience;
  String? departmentId;
  DateTime? dateTime;

  NotificationModel(
      {this.id,
      this.title,
      this.body,
      this.audience,
      this.departmentId,
      this.dateTime});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    if (json['audience'] == "faculty") {
      audience = Audience.faculty;
    } else if (json['audience'] == "students") {
      audience = Audience.students;
    } else {
      audience = Audience.both;
    }
    departmentId = json['department_id'];
    dateTime = (json['date_time'] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    if (audience == Audience.faculty) {
      data['audience'] = "faculty";
    } else if (audience == Audience.students) {
      data['audience'] = "students";
    } else {
      data['audience'] = "both";
    }
    data['department_id'] = departmentId;
    data['date_time'] = dateTime;
    return data;
  }
}
