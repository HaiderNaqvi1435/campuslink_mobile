import 'package:campuslink_mobile/utils/app_text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../colors/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.obscureText,
    this.controller,
    this.focusNode,
    this.onTap,
    this.readOnly = false,
    this.isInteger = false,
    this.color,
    this.keyboardType,
    this.maxLines,
  });
  final String labelText;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final bool? obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool readOnly;
  final Color? color;
  final bool isInteger;
  final TextInputType? keyboardType;
  final int? maxLines;
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
        TextFormField(
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,
          style: AppTextStyles.blackNormalText,
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText ?? false,
          obscuringCharacter: '*',
          inputFormatters: isInteger // Add this block
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly, // Add this line
                ]
              : null,
          decoration: InputDecoration(
            fillColor: AppColor.fillColor1,
            filled: true,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            prefixIconColor: AppColor.primaryColor,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      suffixIcon,
                      color: color ?? AppColor.hintColor,
                    ))
                : null,
            suffixIconColor: AppColor.hintColor,
            hintText: hintText.tr,
            hintStyle: AppTextStyles.hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 22),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.strokeColor1),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
