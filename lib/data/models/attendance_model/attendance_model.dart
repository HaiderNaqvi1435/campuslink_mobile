import 'package:campuslink_mobile/utils/enums/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceModel {
  String? studentId;
  String? teacherId;
  String? courseId;
  AttendanceStatus? status;
  DateTime? date;

  AttendanceModel(
      {this.courseId, this.teacherId, this.studentId, this.status, this.date});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    teacherId = json['teacher_Id'];
    courseId = json['course_Id'];
    if (json['status'] == 'present') {
      status = AttendanceStatus.present;
    } else if (json['status'] == 'absent') {
      status = AttendanceStatus.absent;
    } else {
      status = AttendanceStatus.leave;
    }
    Timestamp timestamp = json['date'];
    date = timestamp.toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_id'] = studentId;
    data['teacher_Id'] = teacherId;
    data['course_Id'] = courseId;
    if (status == AttendanceStatus.present) {
      data['status'] = 'present';
    } else if (status == AttendanceStatus.absent) {
      data['status'] = 'absent';
    } else {
      data['status'] = 'leave';
    }
    data['date'] = date;
    return data;
  }
}
