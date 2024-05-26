import 'package:campuslink_mobile/utils/app_text_styles/app_text_styles.dart';
import 'package:campuslink_mobile/utils/padding_utils/padding_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showtitleBodyBottomSheet(BuildContext context,
    {String? title, String? body, DateTime? dateTime, IconButton? iconButton}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Padding(
        padding: PaddingUtils.listViewPadding,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(title ?? "", style: AppTextStyles.primaryHeading1),
              subtitle: Text(
                DateFormat('dd MMMM yyyy').format(dateTime!),
                style: AppTextStyles.labelTextBold,
              ),
              trailing: iconButton,
            ),
            Text(
              body ?? "",
              style: AppTextStyles.blackNormalText,
            ),
          ],
        ),
      );
    },
  );
}
