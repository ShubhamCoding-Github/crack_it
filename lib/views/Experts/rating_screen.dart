import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/base_widgets/base_text.dart';
import 'package:crack_it_user/utils/base_widgets/base_text_field.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/utils/constants/base_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  List<String> stickerList = [
    'assets/icons/Layer 2-1.svg',
    'assets/icons/Layer 2-2.svg',
    'assets/icons/Layer 2-3.svg',
    'assets/icons/Layer 2.svg'
  ];
  int selectedStricker = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const BaseAppBar(
        title: 'Rating',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.044,
                ),
                SizedBox(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: const BoxDecoration(color: whiteColor),
                          ),
                          Container(
                            height: Get.height * 0.20,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: backgroundGrayColor),
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Jaxen C",
                                    style: TextStyle(
                                      fontSize: fs24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      "Front-end Expert",
                                      style: TextStyle(
                                          fontSize: fs18,
                                          fontWeight: FontWeight.normal,
                                          color: textGrayColor),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                      Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            userIc2,
                            width: 140,
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                const BaseText(
                  'Give Rate',
                  topMargin: 35.0,
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fs16,
                  bottomMargin: 20.0,
                ),
                RatingBar.builder(
                  unratedColor: lightGrayColor,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  itemBuilder: (context, _) => SvgPicture.asset(starIc),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                BaseTextField(
                  topMargin: 50.0,
                  maxLines: 5,
                  labelText: 'Give Review',
                ),
                const BaseText(
                  'How was experience',
                  topMargin: 30.0,
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fs16,
                  bottomMargin: 20.0,
                ),
                SizedBox(
                  height: 50.0,
                  child: ListView.builder(
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        selectedStricker = index;
                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: selectedStricker == index
                                ? Border.all(color: primaryColor)
                                : null),
                        child: SvgPicture.asset(stickerList[index]),
                      ),
                    ),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                ),
                BaseButton(
                  topMargin: 80,
                  bottomMargin: 80,
                  title: 'SUBMIT REVIEW',
                  onTap: () {
                    // Get.to(() => LoginScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
