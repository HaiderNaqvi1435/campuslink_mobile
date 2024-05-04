import 'package:campuslink_mobile/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../res/assets/icon_assets.dart';
import '../../../../../../res/colors/app_color.dart';

class CourseListTile extends StatelessWidget {
final String courseTitle ;
final String courseCode ;
final String subtitle ;
final String creditHours ;

   const CourseListTile({
    super.key, required this.courseTitle, required this.courseCode, required this.subtitle, required this.creditHours,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColor.hintColor),
          borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Image.asset(
          IconAssets.booksIcon,
        ),
        title:  Text(
          courseTitle,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
             courseCode,
              style: const TextStyle(fontSize: 12, color: AppColor.labelColor),
            ),
             Text(
              subtitle,
              style: const TextStyle(fontSize: 10, color: AppColor.labelColor),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                 creditHours,
                  style: const TextStyle(fontSize: 10, color: AppColor.labelColor),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(RouteName.studentAttendanceView);
                  },
                  child: Container(
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                        color: AppColor.primaryButtonColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        "Attendence",
                        style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
