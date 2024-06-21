import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:flutter/material.dart';

class HodFacultyScheduleView extends StatefulWidget {
  const HodFacultyScheduleView({super.key});

  @override
  State<HodFacultyScheduleView> createState() => _HodFacultyScheduleViewState();
}

class _HodFacultyScheduleViewState extends State<HodFacultyScheduleView> {
  @override
  Widget build(BuildContext context) {
    return const AppThemeWidget(
        title: "Faculty Schedule",
        child: Column(
          children: [],
        ));
  }
}
