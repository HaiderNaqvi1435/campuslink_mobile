import 'package:campuslink_mobile/utils/enums/enums.dart';

class NotificationModel {
  String? id;
  String? title;
  String? body;
  Audience? audience;
  String? departmentId;
  DateTime ? dateTime;

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
    audience = json['audience'];
    departmentId = json['department_id'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['audience'] = audience;
    data['department_id'] = departmentId;
    data['date_time'] = dateTime;
    return data;
  }
}