import 'package:campuslink_mobile/presentation/common/view_models/timetable_view_model/timetable_view_model.dart';
import 'package:campuslink_mobile/presentation/common/views/timetable_view/widgets/time_slot_list_view.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:campuslink_mobile/utils/padding_utils/padding_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/components/week_days_list_view/week_days_list_view.dart';

class TimeTableView extends StatefulWidget {
  const TimeTableView({super.key});

  @override
  State<TimeTableView> createState() => _TimeTableViewState();
}

class _TimeTableViewState extends State<TimeTableView> {
  final tvm = Get.put(TimeTableViewModel());
  @override
  Widget build(BuildContext context) {
    // tvm.filteredSchedule
    //     .assignAll(tvm.getFilteredSchedule(tvm.selectedIndex.value));

    return AppThemeWidget(
        title: "Time Table",
        child: Padding(
          padding: PaddingUtils.defaultPadding,
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tvm.days.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          tvm.selectedIndex.value = index;
                        },
                        child: WeekDaysListView(
                            selectedIndex: tvm.selectedIndex.value,
                            days: tvm.days,
                            index: index),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: tvm.filteredSchedule.length,
                    itemBuilder: (context, index) {
                      var item = tvm.filteredSchedule[index];
                      return TimeSlotListView(item: item);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}


// Text(
                          // 'Prof. ${item['professor']} - Block ${item['block']} - Room ${item['room']}'),