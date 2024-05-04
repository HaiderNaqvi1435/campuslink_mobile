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
    data['is_blocked'] = isBlocked;
    return data;
  }
}
