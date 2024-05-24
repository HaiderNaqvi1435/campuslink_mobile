import 'package:campuslink_mobile/res/colors/app_color.dart';
import 'package:campuslink_mobile/utils/app_text_styles/app_text_styles.dart';
import 'package:campuslink_mobile/utils/enums/enums.dart';
import 'package:flutter/material.dart';

class AttendanceButton extends StatelessWidget {
  const AttendanceButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.status,
    required this.value,
    this.color,
  });

  final ValueChanged<AttendanceStatus> onTap;
  final String label;
  final AttendanceStatus? status;
  final AttendanceStatus value;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(value),
      child: Container(
        height: 20,
        width: 30,
        decoration: BoxDecoration(
            color: value == status ? color : AppColor.greyColor1,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: Center(
            child: Text(
          label,
          style: AppTextStyles.whiteNormalText,
        )),
      ),
    );
  }
}
