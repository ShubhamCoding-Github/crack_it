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

enum SelectedTab { message, booking, add, wallet, user }

class DashboardView extends StatefulWidget {
  final bool isFromOther;
  final int? index;
  const DashboardView({super.key, this.isFromOther = false, this.index});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
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

  final List<Widget> _pages = [
    ChatView(),
    MyBookingBaseView(),
    CategoryView(),
    WalletView(),
    MyProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    // if(_SelectedTab.values.indexOf(_selectedTab) ==2){
    //   Get.to(CategoryView());
    // }
    return Scaffold(
      body: _pages[SelectedTab.values.indexOf(selectedTab)],
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
    );
  }
}
