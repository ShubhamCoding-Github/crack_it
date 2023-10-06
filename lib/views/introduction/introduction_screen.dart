import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Image.asset(
              'assets/images/Mask Group 4@3x.png',
              height: Get.height * 0.5,
            ),
          ),
          Positioned(
            top: 250.0,
            right: 0.0,
            child: Image.asset(
              'assets/images/Mask Group 3@3x.png',
              height: Get.height * 0.5,
            ),
          ),
          Positioned(
            top: 70.0,
            right: 25.0,
            child: Image.asset(
              'assets/images/app_logo_with_name.png',
              height: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}
