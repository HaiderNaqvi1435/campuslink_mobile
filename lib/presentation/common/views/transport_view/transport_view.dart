import 'package:campuslink_mobile/presentation/common/view_models/transport_view_model/transport_view_model.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:campuslink_mobile/utils/app_text_styles/app_text_styles.dart';
import 'package:campuslink_mobile/utils/date_formatter/date_formatter.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/components/week_days_list_view/week_days_list_view.dart';
import '../../../../utils/week_days_manager/week_days_manager.dart';

class TransportView extends StatefulWidget {
  const TransportView({super.key});

  @override
  State<TransportView> createState() => _TransportViewState();
}

class _TransportViewState extends State<TransportView> {
  final tpvm = Get.put(TransportViewModel());
  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
        title: "Transport",
        child: Column(
          children: [
            Obx(
              () => WeekDaysListView(
                onTap: (value) => tpvm.selectedIndex.value = value,
                selectedIndex: tpvm.selectedIndex.value,
                days: WeekDaysManager.days,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(
                () => tpvm.filteredTransportList.isEmpty
                    ? Center(
                        child: Text(
                            "No conveyance available on ${WeekDaysManager.days[tpvm.selectedIndex.value]}"),
                      )
                    : ListView.builder(
                        itemCount: tpvm.filteredTransportList.length,
                        itemBuilder: (context, index) => Card(
                            elevation: 0,
                            color: AppColor.whiteColor,
                            shape: RoundedRectangleBorder(
                                side:
                                    const BorderSide(color: AppColor.hintColor),
                                borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                                title: Text(
                                  "Route ${index + 1}:",
                                  style: AppTextStyles.primaryHeading1,
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tpvm.filteredTransportList[index]
                                                  .driverName ??
                                              "",
                                          style:
                                              AppTextStyles.secondaryHeading1,
                                        ),
                                        const Text(
                                          "Timing",
                                          style:
                                              AppTextStyles.secondaryHeading1,
                                        ),
                                        const Text(
                                          "Route",
                                          style:
                                              AppTextStyles.secondaryHeading1,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tpvm.filteredTransportList[index]
                                                  .busId ??
                                              "",
                                          style: AppTextStyles.blackNormalText,
                                        ),
                                        Text(
                                          "${DateFormatter.getFormattedTime(tpvm.filteredTransportList[index].departureTime!)} - ${DateFormatter.getFormattedTime(tpvm.filteredTransportList[index].arrivalTime!)}",
                                          style: AppTextStyles.blackNormalText,
                                        ),
                                        Text(
                                          "${tpvm.filteredTransportList[index].source} - ${tpvm.filteredTransportList[index].destination}",
                                          style: AppTextStyles.blackNormalText,
                                        ),
                                      ],
                                    )
                                  ],
                                ))),
                      ),
              ),
            )
          ],
        ));
  }
}

































































