class CourseModel {
  String ? courseId;
  String? courseCode;
  String? courseName;
  int? totalLectures;
  int? totalLabs;
  String? departmentId;

  CourseModel(
      {this.courseId,
      this.courseCode,
      this.courseName,
      this.totalLectures,
      this.totalLabs,
      this.departmentId});

  CourseModel.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    courseCode = json['course_code'];
    courseName = json['course_name'];
    totalLectures = json['total_lectures'];
    totalLabs = json['total_labs'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_id'] = courseId;
    data['course_code'] = courseCode;
    data['course_name'] = courseName;
    data['total_lectures'] = totalLectures;
    data['total_labs'] = totalLabs;
    data['department_id'] = departmentId;
    return data;
  }
}
