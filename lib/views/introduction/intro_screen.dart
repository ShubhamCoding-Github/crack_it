import 'package:crack_it_user/utils/base_widgets/base_text.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_sizes.dart';
import 'package:crack_it_user/views/introduction/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../auth/controller/choose_role.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int selectedIndex = 0;
  late PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (val) {
                setState(() {
                  selectedIndex = val;
                });
              },
              itemBuilder: (context, index) => IntroScreen(),
              itemCount: 3,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      width: selectedIndex == index ? 8.0 : 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: selectedIndex == index
                              ? primaryColor
                              : greyColor),
                      duration: const Duration(milliseconds: 300),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                BaseText(
                  'Build Your\nFuture, Build\nYour Dream.',
                  fontSize: fs35,
                  fontWeight: FontWeight.w900,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BaseText(
                      'Provide you with the best experience\npossible',
                      fontSize: fs15,
                      color: textGrayColor2,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (selectedIndex != 2) {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.linear);
                          setState(() {});
                        } else {
                          Get.to(ChooseRole());
                        }
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(28.0),
                        decoration: BoxDecoration(
                            color: primaryColor, shape: BoxShape.circle),
                        child: SvgPicture.asset('assets/icons/right-arrow.svg'),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
