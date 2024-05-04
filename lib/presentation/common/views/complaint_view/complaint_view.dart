import 'package:campuslink_mobile/presentation/common/view_models/complaint_view_model/complaint_view_model.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:campuslink_mobile/utils/padding_utils/padding_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/components/complaint_list_tile/complaint_list_tile.dart';

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
            backgroundColor: AppColor.primaryButtonColor,
            foregroundColor: AppColor.whiteColor,
            onPressed: () {},
            child: const Icon(Icons.add)),
        child: Padding(
          padding: PaddingUtils.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "recent_complaints".tr,
                style:
                    const TextStyle(fontSize: 12, color: AppColor.labelColor),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cvm.filteredComplaints.length,
                  itemBuilder: (context, index) {
                    return ComplaintListTile(
                      complaint: cvm.filteredComplaints[index],
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
