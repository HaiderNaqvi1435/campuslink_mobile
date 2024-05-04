import 'package:campuslink_mobile/data/models/transport_model/transport_model.dart';
import 'package:campuslink_mobile/theme/app_theme_wiget/app_theme_wiget.dart';
import 'package:campuslink_mobile/utils/padding_utils/padding_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/components/week_days_list_view/week_days_list_view.dart';

class TransportView extends StatefulWidget {
  const TransportView({super.key});

  @override
  State<TransportView> createState() => _TransportViewState();
}

class _TransportViewState extends State<TransportView> {
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];
  List<TransportModel> transportList = [
    TransportModel(
        arrivalTime: '06:14AM',
        departureTime: '12:05PM',
        driverName: 'Mushtaq Khan',
        busId: 'LEA-5166',
        dayOfWeek: 'Monday'),
    TransportModel(
        arrivalTime: '09:30AM',
        departureTime: '03:45PM',
        driverName: 'Jane Doe',
        busId: 'LXZ-4821',
        dayOfWeek: 'Wednesday'),
    TransportModel(
        arrivalTime: '01:50PM',
        departureTime: '08:17PM',
        driverName: 'Sara Johnson',
        busId: 'LXZ-1590',
        dayOfWeek: 'Friday'),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<TransportModel> filteredtransportList = transportList
        .where((element) => element.dayOfWeek == days[selectedIndex])
        .toList();
    return AppThemeWidget(
        title: "Transport",
        child: Padding(
          padding: PaddingUtils.defaultPadding,
          child: Column(
            children: [
              SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: WeekDaysListView(
                          selectedIndex: selectedIndex,
                          days: days,
                          index: index),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredtransportList.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 0,
                    color: AppColor.whiteColor,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppColor.hintColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Departure Time",
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                filteredtransportList[index].departureTime!,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Arrival Time",
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                filteredtransportList[index].arrivalTime!,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Bus no.",
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                filteredtransportList[index].busId!,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Driver Name",
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                filteredtransportList[index].driverName!,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
