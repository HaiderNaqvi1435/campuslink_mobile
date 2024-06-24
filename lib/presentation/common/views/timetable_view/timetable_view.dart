import 'package:campuslink_mobile/presentation/common/view_models/timetable_view_model/timetable_view_model.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:campuslink_mobile/utils/week_days_manager/week_days_manager.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/components/week_days_list_view/week_days_list_view.dart';
import '../../view_models/controller/batch_controller/batch_controller.dart';
import '../../view_models/controller/faculty_controller/faculty_controller.dart';
import '../../view_models/controller/room_controller/room_controller.dart';
import '../../view_models/course_view_model/course_view_model.dart';

class TimeTableView extends StatefulWidget {
  const TimeTableView({super.key});

  @override
  State<TimeTableView> createState() => _TimeTableViewState();
}

class _TimeTableViewState extends State<TimeTableView> {
  final tvm = Get.find<TimeTableViewModel>();
  final cvm = Get.find<CourseViewModel>();
  final rc = Get.find<RoomController>();
  final fc = Get.find<FacultyController>();
  final bvm = Get.find<BatchController>();

  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      title: "time_table",
      child: Obx(
        () => Column(
          children: [
            WeekDaysListView(
              onTap: (value) => tvm.selectedIndex.value = value,
              selectedIndex: tvm.selectedIndex.value,
              days: WeekDaysManager.days,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tvm.filteredScheduleList.length,
                itemBuilder: (context, index) {
                  var item = tvm.filteredScheduleList[index];
                  return ListTile(
                    shape: const UnderlineInputBorder(),
                    leading: const Icon(Icons.access_time_outlined),
                    title: Text(
                      "${DateFormat('hh:mma').format(item.startTime!)} - ${DateFormat('hh:mma').format(item.endTime!)}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tvm.isTeacher.value
                              ? '${item.batchId} (${bvm.getSemesterFromBatchId(item.batchId!)})'
                              : 'Prof. ${fc.getTeacherNameById(item.teacherId!)}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColor.labelColor,
                          ),
                        ),
                        Text(
                          "${cvm.getCourseCodeById(item.courseId!)} ${cvm.getCourseNameById(item.courseId!)}",
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColor.labelColor,
                          ),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Block. ${rc.getBlockById(item.roomId!)}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColor.labelColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Room. ${rc.getRoomNoById(item.roomId!)}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColor.labelColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
