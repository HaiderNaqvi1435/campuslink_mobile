import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/user_data_model/address_model/address_model.dart';
import '../../../../data/models/user_data_model/teacher_data_model/teacher_data_model.dart';
import '../../../../res/routes/routes_name.dart';
import '../../../../services/firebase_services/firebase_auth_services/firebase_auth_services.dart';
import '../../../../utils/enums/enums.dart';
import '../../../../utils/input_controllers/user_input/user_input.dart';
import '../../../../utils/utils.dart';
import '../../../common/view_models/controller/sign_up_controller/sign_up_controller.dart';

class TeacherSignViewModel extends GetxController implements SignUpController {
  @override
  UserInput controller = UserInput();
  @override
  final RxBool isLoading = false.obs;
  @override
  final RxBool obscureText = true.obs;

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  Future<void> teacherSignUp(BuildContext context) async {
    if (controller.emailController.value.text.isEmail) {
      if (areFieldsValid()) {
        isLoading(true);
        try {
          final student = createTeacherDataModel();
          await FirebaseAuthServices.signUp(
              student, controller.passwordController.value.text);
          controller.clear();
          Utils.showSnackBar(context, "Verification email sent.");

          await Get.offNamed(RouteName.initialLoginView);
        } catch (e) {
          isLoading(false);

          Utils.showSnackBar(context, "Error $e");
        } finally {
          isLoading(false);
          controller.clear();
        }
      } else {
        Utils.showSnackBar(
            context, 'Error: Please fill all the fields before proceeding.');
      }
    } else {
      Utils.showSnackBar(context, 'Please enter a correct email');
    }
  }

  bool areFieldsValid() {
    return controller.emailController.value.text.isNotEmpty &&
        controller.passwordController.value.text.isNotEmpty &&
        controller.nameController.value.text.isNotEmpty &&
        controller.fatherNameController.value.text.isNotEmpty &&
        controller.cnicController.value.text.isNotEmpty &&
        controller.phoneController.value.text.isNotEmpty &&
        controller.addressController.value.text.isNotEmpty &&
        controller.cityController.value.text.isNotEmpty &&
        controller.stateController.value.text.isNotEmpty &&
        controller.datetime.value.year != DateTime.now().year &&
        controller.deptValue.isNotEmpty;
  }

  TeacherDataModel createTeacherDataModel() {
    return TeacherDataModel(
      email: controller.emailController.value.text.toLowerCase(),
      name: controller.nameController.value.text.capitalize,
      fatherName: controller.fatherNameController.value.text.capitalize,
      cnic: controller.cnicController.value.text,
      phone: controller.phoneController.value.text,
      gender: controller.genderValue.value,
      dob: controller.datetime.value,
      address: Address(
        address: controller.addressController.value.text.capitalizeFirst,
        city: controller.cityController.value.text.capitalize,
        state: controller.stateController.value.text.capitalize,
      ),
      role: UserRole.teacher,
      isBlocked: true,
      departmentId: controller.deptValue.value,
      isHod: false,
    );
  }
}
