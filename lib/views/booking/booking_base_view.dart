import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/views/booking/booking_tab_view.dart';
import 'package:crack_it_user/views/booking/sub_pages/cancled_booking_view.dart';
import 'package:crack_it_user/views/booking/sub_pages/past_booking_view.dart';
import 'package:flutter/material.dart';

class MyBookingBaseView extends StatelessWidget {
  const MyBookingBaseView({super.key});
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
                  labelColor: whiteColor,
                  unselectedLabelColor: blackColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(19.0),
                    color: primaryColor,
                  ),
                  labelStyle: const TextStyle(fontSize: 16),
                  tabs: [
                    const Tab(text: 'Upcoming'),
                    const Tab(text: 'Past'),
                    const Tab(text: 'Cancelled'),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    MyBookingTabView(),
                    PastBookingTabView(),
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
