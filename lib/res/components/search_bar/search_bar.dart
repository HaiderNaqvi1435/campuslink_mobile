
import 'package:campuslink_mobile/res/colors/app_color.dart';
import 'package:campuslink_mobile/utils/app_text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<String?>? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: AppTextStyles.blackNormalText,
      decoration: InputDecoration(
          hintText: "Search",
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
              gapPadding: 0),
          fillColor: AppColor.greyColor1,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
    );
  }
}
