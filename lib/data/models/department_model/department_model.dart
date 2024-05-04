class DepartmentModel {
  String? departmentId;
  String? departmentName;

  DepartmentModel({this.departmentId, this.departmentName});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    departmentId = json['department_id'];
    departmentName = json['department_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['department_id'] = departmentId;
    data['department_name'] = departmentName;
    return data;
  }
}