import '../user_data_model.dart';

class TeacherDataModel extends UserDataModel {
  String? departmentId;
  bool? isHod;

  TeacherDataModel({
    super.userId,
    super.email,
    super.name,
    super.fatherName,
    super.cnic,
    super.phone,
    super.address,
    super.role,
    super.isBlocked,
    this.departmentId,
    this.isHod,
  });

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['department_id'] = departmentId;
    data['isHod'] = isHod;
    return data;
  }
}
