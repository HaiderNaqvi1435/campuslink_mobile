class CourseModel {
  String? courseCode;
  String? courseName;
  String? creditHours;
  String? departmentId;

  CourseModel(
      {this.courseCode, this.courseName, this.creditHours, this.departmentId});

  CourseModel.fromJson(Map<String, dynamic> json) {
    courseCode = json['course_code'];
    courseName = json['course_name'];
    creditHours = json['credit_hours'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_code'] = courseCode;
    data['course_name'] = courseName;
    data['credit_hours'] = creditHours;
    data['department_id'] = departmentId;
    return data;
  }
}