import 'package:campuslink_mobile/utils/app_text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors/app_color.dart';

class AuthDropdown extends StatelessWidget {
  const AuthDropdown({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.items,
    this.onChanged,
  });

  final String labelText;
  final String hintText;
  final List<DropdownMenuItem<String>>? items;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${labelText.tr}:",
          style: AppTextStyles.labelText,
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          style: AppTextStyles.blackNormalText,
          onChanged: onChanged,
          items: items,
          decoration: InputDecoration(
            fillColor: AppColor.fillColor1,
            filled: true,
            hintText: hintText.tr,
            hintStyle: AppTextStyles.hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 22),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.strokeColor1),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
