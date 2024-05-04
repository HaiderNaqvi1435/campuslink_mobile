import 'package:campuslink_mobile/utils/enums/enums.dart';
import 'package:get/get.dart';

import '../../../../data/models/batch_model/batch_model.dart';
import '../../../../data/models/notification_model/notification_model.dart';
import '../../../../data/models/user_data_model/student_data_model/student_data_model.dart';
import '../../../../data/models/user_data_model/teacher_data_model/teacher_data_model.dart';
import '../../../../data/models/user_data_model/user_data_model.dart';
import '../../../../data/repositories/sample_data/sample_data.dart';

class NotificationViewModel extends GetxController {
  final SampleData sampledata = SampleData();
  RxList filteredNotifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredNotifications.assignAll(getFilteredNotifications());
  }

  List<NotificationModel> getFilteredNotifications() {
    return sampledata.randomNotifications.where((notification) {
      bool audienceMatch = notification.audience == Audience.both ||
          notification.audience == Audience.students;

      bool departmentMatch = notification.departmentId ==
          getDepartmentId(
              sampledata.currentUserStudent, sampledata.listOfBatches);

      return audienceMatch && departmentMatch;
    }).toList();
  }

  String getDepartmentId(UserDataModel user, List<BatchModel> batches) {
    if (user is StudentDataModel) {
      BatchModel? batch = batches.firstWhere(
        (b) => b.batchId == user.batchId,
      );

      return batch.departmentId ?? '';
    } else if (user is TeacherDataModel) {
      return user.departmentId!;
    }
    return '';
  }
}

























 // List<NotificationModel> filteredNotifications = filterNotifications(
    //   notifications: sampledata.randomNotifications,
    //   currentUser: sampledata.currentUser,
    //   audienceFilter: 'Students',
    //   departmentFilter: 'currentuserDepartment',
    //   batchList: SampleData().listOfBatches,
    // );



  //   List<NotificationModel> filterNotifications({
  //   required List<NotificationModel> notifications,
  //   required dynamic currentUser,
  //   required String audienceFilter,
  //   required String departmentFilter,
  //   required List<BatchModel> batchList,
  // }) {
  //  

  //   String currentUserDepartmentId = getDepartmentId(currentUser, batchList);

  //  
