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
    super.gender,
    super.dob,
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

  factory TeacherDataModel.fromJson(Map<String, dynamic> json) {
    // Initialize fields from the UserDataModel
    UserDataModel userData = UserDataModel.fromJson(json);
    return TeacherDataModel(
      userId: userData.userId,
      email: userData.email,
      name: userData.name,
      fatherName: userData.fatherName,
      cnic: userData.cnic,
      phone: userData.phone,
      gender: userData.gender,
      dob: userData.dob,
      address: userData.address,
      role: userData.role,
      isBlocked: userData.isBlocked,
      // Initialize fields specific to TeacherDataModel
      departmentId: json['department_id'],
      isHod: json['isHod'],
    );
  }
}
