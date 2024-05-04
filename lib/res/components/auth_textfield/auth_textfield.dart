import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors/app_color.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.onPressed,
      this.obscureText,
      this.controller,
      this.focusNode});
  final String labelText;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final bool? obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
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
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText ?? false,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            fillColor: AppColor.fillColor1,
            filled: true,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            prefixIconColor: AppColor.primaryColor,
            suffixIcon: prefixIcon != null
                ? IconButton(onPressed: onPressed, icon: Icon(suffixIcon))
                : null,
            suffixIconColor: AppColor.hintColor,
            hintText: hintText.tr,
            hintStyle: const TextStyle(color: AppColor.hintColor, fontSize: 14),
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
