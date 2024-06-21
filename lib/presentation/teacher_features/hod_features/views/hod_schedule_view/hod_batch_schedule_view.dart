import 'package:flutter/material.dart';

import '../../../../../theme/app_theme_wiget/app_theme_wiget.dart';

class HodBatchScheduleView extends StatefulWidget {
  const HodBatchScheduleView({super.key});

  @override
  State<HodBatchScheduleView> createState() => _HodBatchScheduleViewState();
}

class _HodBatchScheduleViewState extends State<HodBatchScheduleView> {
  @override
  Widget build(BuildContext context) {
    return const AppThemeWidget(
        title: "Batch Schedule",
        child: Column(
          children: [],
        ));
  }
}