import 'package:campuslink_mobile/presentation/common/view_models/complaint_view_model/complaint_view_model.dart';
import 'package:campuslink_mobile/res/routes/routes_name.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:campuslink_mobile/utils/app_box_decorations/app_box_decorations.dart';
import 'package:campuslink_mobile/utils/app_text_styles/app_text_styles.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../res/colors/app_color.dart';
import 'widgets/show_complaint_details.dart';

class ComplaintView extends StatefulWidget {
  const ComplaintView({super.key});

  @override
  State<ComplaintView> createState() => _ComplaintViewState();
}

class _ComplaintViewState extends State<ComplaintView> {
  final cvm = Get.put(ComplaintViewModel());
  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
        title: "Complaint Box",
        floatingActionButton: FloatingActionButton(
            mini: true,
            backgroundColor: AppColor.primaryButtonColor,
            foregroundColor: AppColor.whiteColor,
            onPressed: () {
              Get.toNamed(RouteName.newComplainView);
            },
            child: const Icon(Icons.add)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "recent_complaints".tr,
              style: const TextStyle(fontSize: 12, color: AppColor.labelColor),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: cvm.filteredComplaints.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: AppBoxDecoration.underLinedBox,
                      child: ListTile(
                        dense: true,
                        onTap: () => showComplaintDetails(
                            context, cvm.filteredComplaints[index]),
                        leading: const Icon(
                          Icons.report_problem_rounded,
                          color: AppColor.primaryColor,
                        ),
                        title: Text(cvm.filteredComplaints[index].title!,
                            style: AppTextStyles.primaryHeading0),
                        subtitle: Text(
                            DateFormat('dd MMMM yyyy').format(
                                cvm.filteredComplaints[index].dateTime!),
                            style: AppTextStyles.labelTextBold),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }
}
