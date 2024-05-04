import 'package:campuslink_mobile/data/models/notification_model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../colors/app_color.dart';

class NotificationsListTile extends StatelessWidget {
  const NotificationsListTile({
    required this.notification,
    super.key,
  
  });
final NotificationModel notification;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.notifications,
            color: AppColor.primaryColor,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notification.title!,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat('EEE - h:mm a').format(notification.dateTime!),
                style: const TextStyle(
                    fontSize: 10,
                    color: AppColor.labelColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          subtitle: Text(
            maxLines: 2,
            notification.body!,
            style: const TextStyle(fontSize: 12, color: AppColor.labelColor),
          ),
        ),
        const Divider(
          color: AppColor.hintColor,
          height: 0,
        ),
      ],
    );
  }
}
