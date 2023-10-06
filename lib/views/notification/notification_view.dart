import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/views/dashboard/dashboard_view.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  var selectedTab = SelectedTab.add;
  void _handleIndexChanged(int i) {
    setState(() {
      // selectedTab = SelectedTab.values[i];
    });

    Get.offAll(DashboardView(
      isFromOther: true,
      index: i,
    ));
  }

  _getSelectedColor(int index) {
    return SelectedTab.values.indexOf(selectedTab) == index
        ? primaryColor
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: "Notifications",
        isNotificationVisible: false,
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: SelectedTab.values.indexOf(selectedTab),
        dotIndicatorColor: Colors.transparent,
        unselectedItemColor: Colors.grey[300],
        splashBorderRadius: 50,
        enableFloatingNavBar: true,
        backgroundColor: bottomNavBgColor,
        borderRadius: 20,
        enablePaddingAnimation: false,
        onTap: _handleIndexChanged,
        items: [
          DotNavigationBarItem(
            icon: SvgPicture.asset(massageIc, color: _getSelectedColor(0)),
            selectedColor: Color(0xff73544C),
          ),

          DotNavigationBarItem(
            icon: SvgPicture.asset(bookIc, color: _getSelectedColor(1)),
            selectedColor: Color(0xff73544C),
          ),

          /// Search
          DotNavigationBarItem(
            icon: SvgPicture.asset(addIc),
            selectedColor: Color(0xff73544C),
          ),

          /// Profile
          DotNavigationBarItem(
            icon: SvgPicture.asset(walletIc, color: _getSelectedColor(3)),
            selectedColor: Color(0xff73544C),
          ),

          /// Profile
          DotNavigationBarItem(
            icon: SvgPicture.asset(userIc, color: _getSelectedColor(4)),
            selectedColor: Color(0xff73544C),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: List.generate(
              4,
              (index) => baseNotificationCard(
                    index: index,
                  )),
        ),
      ),
    );
  }
}

class baseNotificationCard extends StatelessWidget {
  const baseNotificationCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // SvgPicture.asset(walletTnxIc,width: 60,),
                  // const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Booking Confirmed",
                        style: TextStyle(
                            fontSize: 20,
                            color: blackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          "It is a long established fact that a reader will be",
                          style: TextStyle(fontSize: 14, color: textGrayColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "9:27 AM",
                        style: TextStyle(
                            //fontSize: 22,
                            color: textGrayColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
