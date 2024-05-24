import 'package:campuslink_mobile/presentation/common/view_models/dashboard_view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../res/components/dashboard_button/dashboard_button.dart';
import '../../../../res/routes/routes_name.dart';
import '../../../../theme/app_theme_wiget/app_theme_wiget.dart';
import '../../view_models/controller/faculty_controller/faculty_controller.dart';
import '../../view_models/controller/room_controller/room_controller.dart';
import '../../view_models/course_view_model/course_view_model.dart';
import '../../view_models/timetable_view_model/timetable_view_model.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final dvm = Get.put(DashboardViewModel());
   final tvm = Get.put(TimeTableViewModel());
  final rc = Get.put(RoomController());
  final fc = Get.put(FacultyController());
  final cvm = Get.put(CourseViewModel());

  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      automaticallyImplyLeading: false,
      title: "Dashboard",
      child: Column(
        children: [
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              children: [
                DashboardButton(
                  onPressed: () {
                    Get.toNamed(RouteName.coursesView);
                  },
                  title: "courses",
                  imageAsset: IconAssets.coursesIcon,
                ),
                DashboardButton(
                  onPressed: () {
                    Get.toNamed(RouteName.timeTableView);
                  },
                  title: "timetable",
                  imageAsset: IconAssets.timetableIcon,
                ),
                DashboardButton(
                  onPressed: () {
                    Get.toNamed(RouteName.notificationView);
                  },
                  title: "notifications",
                  imageAsset: IconAssets.notificationIcon,
                ),
                DashboardButton(
                  onPressed: () {
                    Get.toNamed(RouteName.complaintView);
                  },
                  title: "complaint",
                  imageAsset: IconAssets.complaintIcon,
                ),
                DashboardButton(
                  onPressed: () {
                    Get.toNamed(RouteName.transportView);
                  },
                  title: "transport",
                  imageAsset: IconAssets.transportIcon,
                ),
                DashboardButton(
                  onPressed: () async => dvm.ac.signOut(),
                  title: "sign_out",
                  imageAsset: IconAssets.logoutIcon,
                ),
              ],
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
