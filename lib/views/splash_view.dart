
import 'package:crack_it_user/base_controller.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/views/dashboard/dashboard_view.dart';
import 'package:crack_it_user/views/introduction/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../storage/base_shared_preference.dart';
import '../storage/sp_keys.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  BaseController controller=Get.put(BaseController());
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), ()async {
      bool isLoggedIn = await BaseSharedPreference().getBool(SpKeys.isLoggedIn)??false;
      if(isLoggedIn){
        Get.offAll(const DashboardView());
       }else{
        Get.offAll(const IntroductionScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              logoPng,
              scale: 2.6,
            )
          ],
        ),
      ),
    );
  }
}
