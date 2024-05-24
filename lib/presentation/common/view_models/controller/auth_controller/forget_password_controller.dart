import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../services/firebase_services/firebase_auth_services/firebase_auth_services.dart';
import '../../../../../utils/utils.dart';

class ForgetPasswordController extends GetxController {
  final emailResetController = TextEditingController().obs;
  final RxBool isLoading = false.obs;
  @override
  void onClose() {
    emailResetController.value.dispose();
    super.onClose();
  }

  void sendPasswordResetEmail(BuildContext context) async {
    try {
      isLoading(true);
      String email = emailResetController.value.text;
      if (email.isEmpty) {
        Utils.showSnackBar(context, 'Please enter your email.');
        isLoading(false);

        return;
      }
      await FirebaseAuthServices.sendPasswordResetEmail(email);
      isLoading(false);

      Utils.showSnackBar(context, 'Password reset email sent.');
      emailResetController.value.clear();
    } catch (e) {
      isLoading(false);

      Utils.showSnackBar(context, 'Error: ${e.toString()}');
    }
  }
}
