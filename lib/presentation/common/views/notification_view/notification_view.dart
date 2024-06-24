import 'package:campuslink_mobile/presentation/common/view_models/notification_view_model/notification_view_model.dart';
import 'package:campuslink_mobile/res/widgets/build_title_body_bottom_sheet.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:campuslink_mobile/utils/app_box_decorations/app_box_decorations.dart';
import 'package:campuslink_mobile/utils/date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';

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
      child: Obx(
        () => nvm.filteredNotifications.isEmpty
            ? const Center(
                child: Text("No notifications"),
              )
            : ListView.builder(
                itemCount: nvm.filteredNotifications.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: AppBoxDecoration.underLinedBox,
                    child: ListTile(
                      onTap: () => showtitleBodyBottomSheet(
                        context,
                        title: nvm.filteredNotifications[index].title,
                        body: nvm.filteredNotifications[index].body,
                        dateTime: nvm.filteredNotifications[index].dateTime,
                      ),
                      leading: const CircleAvatar(
                        backgroundColor: AppColor.greyColor1,
                        child: Icon(
                          Icons.notifications,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      title: Text(
                        nvm.filteredNotifications[index].title ?? "",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        DateFormatter.getFormattedDateTime(
                            nvm.filteredNotifications[index].dateTime!),
                        style: const TextStyle(
                            fontSize: 12, color: AppColor.labelColor),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
