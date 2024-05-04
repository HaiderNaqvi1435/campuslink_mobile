import 'package:campuslink_mobile/data/models/user_data_model/teacher_data_model/teacher_data_model.dart';
import 'package:campuslink_mobile/data/repositories/sample_data/sample_data.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/time_table_model/time_table_model.dart';
import '../../../../../res/colors/app_color.dart';

class TimeSlotListView extends StatelessWidget {
  const TimeSlotListView({
    super.key,
    required this.item,
  });

  final TimeTableModel item;

  @override
  Widget build(BuildContext context) {
    final data = SampleData();
    TeacherDataModel teacher = data.listOfTeachers.firstWhere(
      (element) => element.userId == item.teacherId,
      orElse: () =>
          TeacherDataModel(userId: '12345678901'), // Provide a default object
    );
    return ListTile(
      leading: const Icon(Icons.access_time_outlined),
      title: Text(
        "${item.starttime} - ${item.endtime}",
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Prof. ${teacher.name}',
            style: const TextStyle(fontSize: 10, color: AppColor.labelColor),
          ),
          Text(
            item.courseCode.toString(),
            style: const TextStyle(fontSize: 10, color: AppColor.labelColor),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Block. ${item.block}',
            style: const TextStyle(
                fontSize: 10,
                color: AppColor.labelColor,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Room. ${item.roomId}',
            style: const TextStyle(
                fontSize: 10,
                color: AppColor.labelColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
