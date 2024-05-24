import 'package:campuslink_mobile/presentation/common/view_models/attendance_view_model/attendance_view_model.dart';
import 'package:campuslink_mobile/utils/app_text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Future<dynamic> showCustomDatePicker(BuildContext context) {
  final avm = Get.find<AttendanceViewModel>();
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        "Select Date",
        style: AppTextStyles.primaryHeading2,
      ),
      content: ListView.builder(
        shrinkWrap: true,
        itemCount: avm.dateList.length,
        itemBuilder: (context, index) => TextButton(
          onPressed: () {
            avm.attendanceDate.value = avm.dateList[index];
            avm.filterAttendanceByDate();
            Navigator.pop(context);
          },
          child: Text(DateFormat('dd MMMM yyyy').format(avm.dateList[index])),
        ),
      ),
    ),
  );
}
