import 'package:campuslink_mobile/data/models/complaint_model/complaint_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../colors/app_color.dart';

class ComplaintListTile extends StatelessWidget {
  const ComplaintListTile({
    required this.complaint,
    super.key,
  });
  final ComplaintModel complaint;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => showComplaintDetails(context, complaint),
          leading: const Icon(
            Icons.report_problem_rounded,
            color: AppColor.primaryColor,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                complaint.title!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('EEE - h:mm a').format(complaint.dateTime!),
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColor.labelColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          subtitle: Text(
            maxLines: 2,
            complaint.body!,
            style: const TextStyle(
              fontSize: 10,
              color: AppColor.labelColor,
            ),
          ),
        ),
        const Divider(
          color: AppColor.hintColor,
          height: 1,
        ),
      ],
    );
  }
}

void showComplaintDetails(BuildContext context, ComplaintModel complaint) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          children: <Widget>[
            ListTile(
              title: Text(complaint.title!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle:
                  Text(DateFormat('EEE - h:mm a').format(complaint.dateTime!)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(complaint.body!),
            ),
          ],
        ),
      );
    },
  );
}
