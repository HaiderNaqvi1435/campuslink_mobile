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
    this.value,
  });

  final String labelText;
  final String hintText;
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${labelText.tr}:",
          style: const TextStyle(color: AppColor.labelColor, fontSize: 14),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              
              value: item,
              child: Text(item),
            );
          }).toList(),
          decoration: InputDecoration(
            fillColor: AppColor.fillColor1,
            filled: true,
            hintText: hintText.tr,
            hintStyle: const TextStyle(color: AppColor.hintColor, fontSize: 14),
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
