import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/views/notification/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onBackPressed;
  final String? title;
  final bool isNotificationVisible;
  final Widget? customtitle;
  const BaseAppBar(
      {super.key,
      this.onBackPressed,
      this.title,
      this.customtitle,
      this.isNotificationVisible = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          centerTitle: customtitle != null ? false : true,
          title: customtitle ??
              Text(
                title ?? "",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          leading:onBackPressed!=null? InkWell(
            onTap:onBackPressed,
            child: Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: bottomNavBgColor,
                    borderRadius: BorderRadius.circular(15)),
                child: SvgPicture.asset(returnIc)),
          ):SizedBox(),
          actions: [
            isNotificationVisible
                ? IconButton(
                    onPressed: () {
                      Get.to(const NotificationView());
                    },
                    icon: SvgPicture.asset(
                      notificationIc,
                      color: Colors.black,
                    ))
                : const SizedBox.shrink()
          ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
