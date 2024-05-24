import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../enums/enums.dart';

class UserInput {
  final RxString deptValue = "".obs;
  final RxString batchValue = "".obs;
  final RxBool isHod = false.obs;
  final RxBool isBlock = false.obs;

  final Rx<Gender?> genderValue = Gender.male.obs;
  Rx<DateTime> datetime = DateTime.now().obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var dobController = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  var fatherNameController = TextEditingController().obs;
  var cnicController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var cityController = TextEditingController().obs;
  var stateController = TextEditingController().obs;
  var rollNoController = TextEditingController().obs;
  void dispose() {
    emailController.value.dispose();
    passwordController.value.dispose();
    nameController.value.dispose();
    fatherNameController.value.dispose();
    cnicController.value.dispose();
    phoneController.value.dispose();
    addressController.value.dispose();
    cityController.value.dispose();
    stateController.value.dispose();
    rollNoController.value.dispose();
    dobController.value.dispose();
  }

  void clear() {
    deptValue.value = "";
    batchValue.value = "";
    isHod.value = false;
    genderValue.value = Gender.male;
    datetime.value = DateTime.now();
    emailController.value.clear();
    passwordController.value.clear();
    nameController.value.clear();
    fatherNameController.value.clear();
    cnicController.value.clear();
    phoneController.value.clear();
    addressController.value.clear();
    cityController.value.clear();
    stateController.value.clear();
    rollNoController.value.clear();
    dobController.value.clear();
  }
}
