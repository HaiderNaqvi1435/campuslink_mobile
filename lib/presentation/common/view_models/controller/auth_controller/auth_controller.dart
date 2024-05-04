import 'package:get/get.dart';

import '../../../../../res/routes/routes_name.dart';

class AuthController extends GetxController {
  bool? isTeacher;

  login() {
    if (isTeacher!) {
      // Get.toNamed(RouteName.signUpViewTeacher);
      print("Teacher Dashboard: ");
      Get.offNamed(RouteName.teacherDashboardView);
    } else {
      Get.offNamed(RouteName.studentDashboardView);
    }
  }
}
