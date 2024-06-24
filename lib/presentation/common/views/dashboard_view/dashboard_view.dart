import 'package:campuslink_mobile/presentation/common/view_models/dashboard_view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/components/dashboard_button/dashboard_button.dart';
import '../../../../res/routes/routes_name.dart';
import '../../../../theme/app_theme_wiget/app_theme_wiget.dart';
import '../../view_models/timetable_view_model/timetable_view_model.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final dvm = Get.put(DashboardViewModel());

  @override
  void initState() {
    super.initState();
   Get.put(TimeTableViewModel());

  //   Get.put(BatchController());
  //   Get.put(DepartmentController());
  //   Get.put(FacultyController());
  //   Get.put(RoomController());
  //   Get.put(CourseViewModel());
  //   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      action: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColor.whiteColor,
        ),
        child: const Icon(
          Icons.person,
          color: AppColor.secondaryColor,
        ),
      ),
      actionOnTap: () => Get.toNamed(RouteName.profileView),
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
                // if (avc.studentData.value.userId == '' &&
                //     avc.teacherData.value.isHod == true)
                //   DashboardButton(

                //     onPressed: () {},
                //     title: "Faculty Schedule",
                //     imageAsset: IconAssets.transportIcon,
                //   ),
                // if (avc.teacherData.value.isHod == true)
                //   DashboardButton(
                //     onPressed: () {
                //       print(avc.studentData.value.userId);
                //     },
                //     title: "Batches Schedule",
                //     imageAsset: IconAssets.transportIcon,
                //   ),
              ],
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
