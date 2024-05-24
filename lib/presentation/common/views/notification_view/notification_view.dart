import 'package:campuslink_mobile/presentation/common/view_models/notification_view_model/notification_view_model.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/components/notifications_list_tile/notifications_list_tile.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final nvm = Get.put(NotificationViewModel());
  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      title: "notifications",
      child: ListView.builder(
        itemCount: nvm.filteredNotifications.length,
        itemBuilder: (context, index) {
          return NotificationsListTile(
            notification: nvm.filteredNotifications[index],
          );
        },
      ),
    );
  }
}
