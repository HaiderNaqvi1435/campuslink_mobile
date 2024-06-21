import 'package:campuslink_mobile/presentation/common/view_models/controller/auth_controller/auth_controller.dart';
import 'package:get/get.dart';

import '../presentation/common/view_models/controller/batch_controller/batch_controller.dart';
import '../presentation/common/view_models/controller/department_controller/department_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(BatchController());
    Get.put(DepartmentController());
    
    // Get.put(LoginViewModel());
    // Get.put(ParkingDetailViewModel());
  }
}
