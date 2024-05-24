class DepartmentModel {
  String? departmentId;
  String? departmentTitle;
  int? students;

  DepartmentModel({this.departmentId, this.departmentTitle, this.students});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    departmentId = json['department_id'];
    departmentTitle = json['department_title'];
    students = json['students'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['department_id'] = departmentId;
    data['department_title'] = departmentTitle;
    data['students'] = students;
    return data;
  }
}
