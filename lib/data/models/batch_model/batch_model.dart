
import '../../../utils/enums/enums.dart';

class BatchModel {
  String? batchId;
  String? session;
  SessionType? type;
  String? semester;
  String? program;
  String? departmentId;

  BatchModel(
      {this.batchId,
      this.session,
      this.type,
      this.semester,
      this.program,
      this.departmentId});

  BatchModel.fromJson(Map<String, dynamic> json) {
    batchId = json['batch_id'];
    session = json['session'];
    type =
        json['type'] == 'morning' ? SessionType.morning : SessionType.replica;
    semester = json['semester'];
    program = json['program'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['batch_id'] = batchId;
    data['session'] = session;
    data['type'] = type == SessionType.morning ? 'morning' : 'replica';
    data['semester'] = semester;
    data['program'] = program;
    data['department_id'] = departmentId;
    return data;
  }
}
