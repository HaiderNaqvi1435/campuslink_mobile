import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/colors/app_color.dart';

class AppThemeWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final bool centerTitle;
  final FloatingActionButton? floatingActionButton;
  final bool automaticallyImplyLeading;
  const AppThemeWidget(
      {super.key,
      required this.child,
      this.automaticallyImplyLeading = true,
      this.centerTitle = true,
      this.floatingActionButton,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffB34546),
            Color(0xff5E7EB7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          stops: [0.0, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: automaticallyImplyLeading,
          centerTitle: centerTitle,
          iconTheme: const IconThemeData(color: AppColor.whiteColor),
          backgroundColor: Colors.transparent,
          title: Text(
            title.tr,
            style: const TextStyle(
                color: AppColor.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
              ),
            ),
            child: child),
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}