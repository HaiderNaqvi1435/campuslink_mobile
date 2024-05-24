import 'package:campuslink_mobile/presentation/common/view_models/complaint_view_model/complaint_view_model.dart';
import 'package:campuslink_mobile/res/components/custom_textfield/custom_textfield.dart';
import 'package:campuslink_mobile/res/components/large_button/large_button.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewComplainView extends StatefulWidget {
  const NewComplainView({super.key});

  @override
  State<NewComplainView> createState() => _NewComplainViewState();
}

class _NewComplainViewState extends State<NewComplainView> {
  final cvm = Get.find<ComplaintViewModel>();
  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
        title: "Enter Complaint",
        child: Column(
          children: [
            CustomTextField(
                controller: cvm.subjectController.value,
                hintText: "Enter Subject",
                labelText: "Subject"),
            CustomTextField(
                controller: cvm.bodyController.value,
                maxLines: 10,
                hintText: "Type",
                labelText: "Body"),
            const SizedBox(height: 20),
            Obx(
              () => LargeButton(
                  isLoading: cvm.isLoading.value,
                  title: "Submit",
                  onPressed: () => cvm.submitComplaint(context)),
            )
          ],
        ));
  }
}
