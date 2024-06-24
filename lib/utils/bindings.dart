import 'package:campuslink_mobile/presentation/common/view_models/controller/auth_controller/auth_controller.dart';
import 'package:get/get.dart';

import '../presentation/common/view_models/controller/batch_controller/batch_controller.dart';
import '../presentation/common/view_models/controller/department_controller/department_controller.dart';
import '../presentation/common/view_models/controller/faculty_controller/faculty_controller.dart';
import '../presentation/common/view_models/controller/room_controller/room_controller.dart';
import '../presentation/common/view_models/course_view_model/course_view_model.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(BatchController());
    Get.put(DepartmentController());
    Get.put(FacultyController());
    Get.put(RoomController());
    Get.put(CourseViewModel());
    // Get.put(LoginViewModel());
    // Get.put(ParkingDetailViewModel());
  }
}
