class BatchModel {
  String? batchId;
  String? session;
  String? semester;
  String? program;
  String? departmentId;

  BatchModel(
      {this.batchId,
      this.session,
      this.semester,
      this.program,
      this.departmentId});

  BatchModel.fromJson(Map<String, dynamic> json) {
    batchId = json['batch_id'];
    session = json['session'];
    semester = json['semester'];
    program = json['program'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['batch_id'] = batchId;
    data['session'] = session;
    data['semester'] = semester;
    data['program'] = program;
    data['department_id'] = departmentId;
    return data;
  }
}