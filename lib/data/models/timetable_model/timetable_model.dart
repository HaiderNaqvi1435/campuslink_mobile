import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TimeTableModel {
  String? slotId;
  DateTime? startTime;
  DateTime? endTime;
  String? courseId;
  String? teacherId;
  String? batchId;
  String? dayOfWeek;
  String? roomId;

  TimeTableModel(
      {
        this.slotId,
        this.startTime,
      this.endTime,
      this.courseId,
      this.teacherId,
      this.batchId,
      this.dayOfWeek,
      this.roomId});

  TimeTableModel.fromJson(Map<String, dynamic> json) {
    // Convert the Timestamp to DateTime and then to the desired string format
    slotId = json['slot_id'];
   
    Timestamp startTimeStamp = json['start_time'];
    Timestamp endTimeStamp = json['end_time'];
    final format = DateFormat('hh:mma');
    startTime = format.parse(format.format(startTimeStamp.toDate()));
    endTime = format.parse(format.format(endTimeStamp.toDate()));
    courseId = json['course_id'];
    teacherId = json['teacher_id'];
    batchId = json['batch_id'];
    dayOfWeek = json['day_of_week'];
    roomId = json['room_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot_id'] = slotId;

    final format = DateFormat('hh:mma');
    // Convert the DateTime to the desired string format before uploading
    data['start_time'] = format.parse(format.format(startTime!));
    data['end_time'] = format.parse(format.format(endTime!));
    data['course_id'] = courseId;
    data['teacher_id'] = teacherId;
    data['batch_id'] = batchId;
    data['day_of_week'] = dayOfWeek;
    data['room_id'] = roomId;
    return data;
  }
}
