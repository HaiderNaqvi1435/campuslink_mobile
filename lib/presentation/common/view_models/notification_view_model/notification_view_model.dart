import 'package:campuslink_mobile/presentation/common/view_models/controller/batch_controller/batch_controller.dart';
import 'package:campuslink_mobile/presentation/common/view_models/timetable_view_model/timetable_view_model.dart';
import 'package:campuslink_mobile/services/firebase_services/firebase_notification_services/firebase_notification_services.dart';
import 'package:campuslink_mobile/utils/enums/enums.dart';
import 'package:get/get.dart';

import '../../../../data/models/notification_model/notification_model.dart';

class NotificationViewModel extends GetxController {
  final RxList<NotificationModel> filteredNotifications =
      <NotificationModel>[].obs;
  final RxList<NotificationModel> notificationsList = <NotificationModel>[].obs;
  final tvm = Get.find<TimeTableViewModel>();
  final bvm = Get.find<BatchController>();
  @override
  void onInit() {
    super.onInit();
    getNotifications();
  }

// Method to get notifications for teachers
  Future<void> getTeacherNotifications() async {
    filteredNotifications.assignAll(notificationsList.where((notification) =>
        (notification.audience == Audience.faculty ||
            notification.audience == Audience.both) &&
        (notification.departmentId == "" ||
            notification.departmentId == tvm.ac.teacherData!.departmentId)));
              filteredNotifications.sort((a, b) => b.dateTime!.compareTo(a.dateTime!),);

  }

// Method to get notifications for students
  Future<void> getStudentNotifications() async {
    filteredNotifications.assignAll(notificationsList.where((notification) =>
        (notification.audience == Audience.students ||
            notification.audience == Audience.both) &&
        (notification.departmentId == "" ||
            notification.departmentId ==
                bvm.getDeptFromBatchId(tvm.ac.studentData!.batchId!))));
              filteredNotifications.sort((a, b) => b.dateTime!.compareTo(a.dateTime!),);
  }

// Main method to decide which notifications to fetch based on the user role
  Future<void> getNotifications() async {
    notificationsList.value =
        await FirebaseNotificationServices.getNotifications();

    if (tvm.isTeacher.value) {
      await getTeacherNotifications();
    } else {
      await getStudentNotifications();
    }
  }

  // List<NotificationModel> getFilteredNotifications() {
  //   return sampledata.randomNotifications.where((notification) {
  //     bool audienceMatch = notification.audience == Audience.both ||
  //         notification.audience == Audience.students;

  //     bool departmentMatch = notification.departmentId ==
  //         getDepartmentId(
  //             sampledata.currentUserStudent, sampledata.listOfBatches);

  //     return audienceMatch && departmentMatch;
  //   }).toList();
  // }

  // String getDepartmentId(UserDataModel user, List<BatchModel> batches) {
  //   if (user is StudentDataModel) {
  //     BatchModel? batch = batches.firstWhere(
  //       (b) => b.batchId == user.batchId,
  //     );

  //     return batch.departmentId ?? '';
  //   } else if (user is TeacherDataModel) {
  //     return user.departmentId!;
  //   }
  //   return '';
  // }
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
