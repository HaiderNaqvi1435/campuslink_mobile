import 'package:campuslink_mobile/presentation/common/view_models/course_view_model/course_view_model.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:campuslink_mobile/utils/padding_utils/padding_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/course_list_tile/course_list_tile.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  final cvm = Get.put(CourseViewModel());
  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
        title: "courses",
        child: Padding(
            padding: PaddingUtils.listViewPadding,
            child: ListView.builder(
              itemCount: cvm.filteredSchedule.length,
              itemBuilder: (context, index) {
                final course = cvm.getIndexedCourses(index);
                // final teacher = cvm.getIndexedTeacher(index);
                final batch = cvm.getIndexedBatch(index);
                return CourseListTile(
                    courseTitle: course.courseName!,
                    courseCode: cvm.filteredSchedule[index].courseCode!,
                    creditHours: course.creditHours!,
                    subtitle: "${batch.program} ${batch.semester}");
              },
            )));
  }
}
