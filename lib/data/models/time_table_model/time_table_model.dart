class TimeTableModel {
  String? starttime;
  String? endtime;
  String? courseCode;
  String? teacherId;
  String? batchId;
  String? dayOfWeek;
  String? block;
  int? roomId;

  TimeTableModel(
      {this.starttime,
      this.endtime,
      this.courseCode,
      this.teacherId,
      this.batchId,
      this.dayOfWeek,
      this.block,
      this.roomId});

  TimeTableModel.fromJson(Map<String, dynamic> json) {
    starttime = json['starttime'];
    endtime = json['endtime'];
    courseCode = json['course_code'];
    teacherId = json['teacher_id'];
    batchId = json['batch_id'];
    dayOfWeek = json['day_of_week'];
    block = json['block'];
    roomId = json['room_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['starttime'] = starttime;
    data['endtime'] = endtime;
    data['course_code'] = courseCode;
    data['teacher_id'] = teacherId;
    data['batch_id'] = batchId;
    data['day_of_week'] = dayOfWeek;
    data['block'] = block;
    data['room_id'] = roomId;
    return data;
  }
}
