import '../../../utils/enums/enums.dart';
import 'address_model/address_model.dart';

class UserDataModel {
  String? userId;
  String? email;
  String? name;
  String? fatherName;
  String? cnic;
  String? phone;
  Address? address;
  UserRole? role;
  bool? isBlocked;

  UserDataModel({
    this.userId,
    this.email,
    this.name,
    this.fatherName,
    this.cnic,
    this.phone,
    this.address,
    this.role,
    this.isBlocked,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    name = json['name'];
    fatherName = json['father_name'];
    cnic = json['cnic'];
    phone = json['phone'];
    isBlocked = json['isBlocked'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    role = json['role'] == 'teacher' ? UserRole.teacher : UserRole.student;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['email'] = email;
    data['name'] = name;
    data['father_name'] = fatherName;
    data['cnic'] = cnic;
    data['phone'] = phone;
    data['is_blocked'] = isBlocked;

    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['role'] = role == UserRole.teacher ? 'teacher' : 'student';
    return data;
  }
}
