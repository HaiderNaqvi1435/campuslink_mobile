import 'package:campuslink_mobile/res/assets/icon_assets.dart';
import 'package:campuslink_mobile/res/routes/routes_name.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:campuslink_mobile/utils/padding_utils/padding_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../res/components/dashboard_button/dashboard_button.dart';

class StudentDashboardView extends StatefulWidget {
  const StudentDashboardView({super.key});

  @override
  State<StudentDashboardView> createState() => _StudentDashboardViewState();
}

class _StudentDashboardViewState extends State<StudentDashboardView> {
  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      automaticallyImplyLeading: false,
      title: "Dashboard",
      child: Padding(
        padding: PaddingUtils.defaultPadding,
        child: Column(
          children: [
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
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
                ],
              ),
            ),
            const SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
