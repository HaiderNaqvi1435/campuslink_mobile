// ignore_for_file: use_build_context_synchronously

import 'package:campuslink_mobile/res/colors/app_color.dart';
import 'package:campuslink_mobile/utils/app_text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
  });

  final VoidCallback onPressed;
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColor.secondaryColor),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        minimumSize: WidgetStateProperty.all(const Size(100, 30)),
        maximumSize: WidgetStateProperty.all(const Size(200, 30)),
      ),
      icon: Icon(icon),
      onPressed: onPressed,
      label: Text(
        label,
        style: AppTextStyles.whiteNormalText,
      ),
    );
  }
}
