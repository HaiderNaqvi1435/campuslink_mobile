class AttendanceModel {
  String? studentId;
  String? teacherId;
  String? courseId;
  String? mark;
  String? date;

  AttendanceModel({this.studentId, this.mark, this.date});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    teacherId = json['teacher_Id'];
    courseId = json['course_Id'];
    mark = json['mark'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_id'] = studentId;
    data['teacher_Id'] = teacherId;
    data['course_Id'] = courseId;
    data['mark'] = mark;
    data['date'] = date;
    return data;
  }
}
