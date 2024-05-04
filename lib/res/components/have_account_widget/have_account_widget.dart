import 'package:flutter/material.dart';

import '../../colors/app_color.dart';

class HaveAccountWidget extends StatelessWidget {
  final bool isLoginPage;
  final VoidCallback onPressed;
  const HaveAccountWidget({
    super.key,
    required this.isLoginPage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        isLoginPage ? "Don't have an account?" : "Already have an account?",
        style: const TextStyle(fontSize: 12, color: AppColor.blackColor),
      ),
      TextButton(
        onPressed: onPressed,
        child: Text(
          isLoginPage ? 'Sign up' : "Login",
          style: const TextStyle(
            fontSize: 12,
            color: AppColor.primaryColor,
          ),
        ),
      )
    ]);
  }
}
