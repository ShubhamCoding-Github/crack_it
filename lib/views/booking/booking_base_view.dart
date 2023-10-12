import 'package:crack_it_user/base_controller.dart';
import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/views/booking/booking_tab_view.dart';
import 'package:crack_it_user/views/booking/sub_pages/cancled_booking_view.dart';
import 'package:crack_it_user/views/booking/sub_pages/past_booking_view.dart';
import 'package:crack_it_user/views/booking/sub_pages/requested_booking_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboard/controller/dashboard_controller.dart';

class MyBookingBaseView extends StatefulWidget {
  const MyBookingBaseView({super.key});

  @override
  State<MyBookingBaseView> createState() => _MyBookingBaseViewState();
}

class _MyBookingBaseViewState extends State<MyBookingBaseView> with SingleTickerProviderStateMixin {
  DashBoardController controller=Get.find<DashBoardController>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    controller.getBookingList();
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      if (!tabController.indexIsChanging) {
        controller.selectedTabIndex.value = tabController.index;
        controller.getBookingList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBody: true,
        appBar: const BaseAppBar(
          title: "My Bookings",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19.0),
                  border: Border.all(color: primaryColor, width: 1),
                ),
                child: TabBar(
                  controller: tabController,
                  labelColor: whiteColor,
                  unselectedLabelColor: blackColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(19.0),
                    color: primaryColor,
                  ),
                  labelStyle: const TextStyle(fontSize: 16),
                  tabs: [
                     Tab(text: (Get.find<BaseController>().user?.role??'').toUpperCase()=="USER"?'Requested':'New'),
                    const Tab(text: 'Upcoming'),
                    const Tab(text: 'Cancelled'),
                  ],
                ),
              ),
               Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    RequestedBookingTabView(),
                    MyBookingTabView(),
                    CancelBookingTabView()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
