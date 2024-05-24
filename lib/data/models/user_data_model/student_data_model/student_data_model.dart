import '../user_data_model.dart';

class StudentDataModel extends UserDataModel {
  int? rollNo;
  String? batchId;

  StudentDataModel({
    super.userId,
    super.email,
    super.name,
    super.fatherName,
    super.cnic,
    super.gender,
    super.dob,
    super.phone,
    super.address,
    super.role,
    super.isBlocked,
    this.rollNo,
    this.batchId,
  });

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['roll_no'] = rollNo;
    data['batch_id'] = batchId;
    
    return data;
  }

    factory StudentDataModel.fromJson(Map<String, dynamic> json) {
    // Initialize fields from the UserDataModel
    UserDataModel userData = UserDataModel.fromJson(json);
    return StudentDataModel(
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
      rollNo: json['roll_no'],
      batchId: json['batch_id'],
    );
  }
}
