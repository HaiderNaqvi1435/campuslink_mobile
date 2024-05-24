import 'package:campuslink_mobile/data/models/complaint_model/complaint_model.dart';
import 'package:campuslink_mobile/presentation/common/view_models/complaint_view_model/complaint_view_model.dart';
import 'package:campuslink_mobile/services/firebase_services/firebase_complaint_services/firebase_complaint_services.dart';
import 'package:campuslink_mobile/utils/padding_utils/padding_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../res/colors/app_color.dart';

void showComplaintDetails(BuildContext context, ComplaintModel complaint) {
  final cvm = Get.find<ComplaintViewModel>();
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Padding(
        padding: PaddingUtils.listViewPadding,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(complaint.title!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle:
                  Text(DateFormat('dd MMMM yyyy').format(complaint.dateTime!)),
              trailing: IconButton(
                  onPressed: () async {
                    await FirebaseComplaintServices.deleteComplaint(
                        complaint.id!);

                    cvm.getComplaints();
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: AppColor.primaryColor,
                  )),
            ),
            Text(complaint.body!),
          ],
        ),
      );
    },
  );
}
