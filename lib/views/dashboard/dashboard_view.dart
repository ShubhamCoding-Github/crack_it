import 'package:crack_it_user/expert_views/profile/my_profile_view_expert.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/views/booking/booking_base_view.dart';
import 'package:crack_it_user/views/category/category_view.dart';
import 'package:crack_it_user/views/chat/chat_list_view.dart';
import 'package:crack_it_user/views/profile/my_profile_view.dart';
import 'package:crack_it_user/views/wallet/wallet_view.dart';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../base_controller.dart';
import 'controller/dashboard_controller.dart';

enum SelectedTab { message, booking, add, wallet, user }
enum SelectedTabExpert { message, booking, wallet, user }

class DashboardView extends StatefulWidget {
  final bool isFromOther;
  final int? index;
  const DashboardView({super.key, this.isFromOther = false, this.index});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashBoardController controller=Get.put(DashBoardController());
  String role='';
  @override
  void initState() {
    if (widget.isFromOther) {
      setState(() {
        selectedTab = SelectedTab.values[widget.index!];
      });
    }
    super.initState();
  }

  var selectedTab = SelectedTab.booking;

  void _handleIndexChanged(int i) {
    setState(() {
      selectedTab = SelectedTab.values[i];
    });
  }

  _getSelectedColor(int index) {
    return SelectedTab.values.indexOf(selectedTab) == index
        ? primaryColor
        : Colors.white;
  }
  final List<Widget> _pagesUser = [
    const ChatView(),
    const MyBookingBaseView(),
    const CategoryView(),
    const WalletView(),
    const MyProfileView(),
  ];

  final List<Widget> _pagesExpert = [
    const ChatView(),
    const MyBookingBaseView(),
    const WalletView(),
    const MyProfileViewExpert(),
  ];
  @override
  Widget build(BuildContext context) {
    role=Get.find<BaseController>().user?.role??'';
    return Scaffold(
      body:role.toUpperCase()=="USER"?_pagesUser[SelectedTab.values.indexOf(selectedTab)]:_pagesExpert[SelectedTab.values.indexOf(selectedTab)],
      extendBody: true,
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
            selectedColor: const Color(0xff73544C),
          ),

          DotNavigationBarItem(
            icon: SvgPicture.asset(bookIc, color: _getSelectedColor(1)),
            selectedColor: const Color(0xff73544C),
          ),

          if(role.toUpperCase()=="USER")...[
          DotNavigationBarItem(
            icon: SvgPicture.asset(addIc),
            selectedColor: const Color(0xff73544C),
          )],
          /// Profile
          DotNavigationBarItem(
            icon: SvgPicture.asset(walletIc, color: _getSelectedColor(role.toUpperCase()=="USER"?3:2)),
            selectedColor: const Color(0xff73544C),
          ),

          /// Profile
          DotNavigationBarItem(
            icon: SvgPicture.asset(userIc, color: _getSelectedColor(role.toUpperCase()=="USER"?4:3)),
            selectedColor: const Color(0xff73544C),
          ),
        ],
      ),
    );
  }
}
