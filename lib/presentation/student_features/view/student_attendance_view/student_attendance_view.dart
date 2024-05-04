import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:flutter/material.dart';

class StudentAttendanceView extends StatefulWidget {
  const StudentAttendanceView({super.key});

  @override
  State<StudentAttendanceView> createState() => _StudentAttendanceViewState();
}

class _StudentAttendanceViewState extends State<StudentAttendanceView> {
  @override
  Widget build(BuildContext context) {
    return const AppThemeWidget(title: "Attendance", child: Column(children: [],));
  }
}