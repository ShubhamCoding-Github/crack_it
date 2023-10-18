import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/base_widgets/base_dialog.dart';
import 'package:crack_it_user/utils/base_widgets/base_svg.dart';
import 'package:crack_it_user/utils/base_widgets/base_text.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/utils/constants/base_sizes.dart';
import 'package:crack_it_user/views/profile/booking_history.dart';
import 'package:crack_it_user/views/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  ProfileController controller=Get.put(ProfileController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.getProfileDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const BaseAppBar(
        title: 'My Profile',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.044,
              ),
              SizedBox(
                child: Obx(() => Stack(
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
                          child:  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${controller.profile.value.firstName??''} ${controller.profile.value.lastName?[0].capitalizeFirst??''}",
                                  style: const TextStyle(
                                    fontSize: fs24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    "User Experience & Motion Design",
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
                        child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        SvgPicture.asset(
                          userIc2,
                          width: 140,
                        ),
                        GestureDetector(
                          onTap: () {
                            showChangeAvtarDialogue(context);
                          },
                          child: SvgPicture.asset(
                            'assets/icons/editIcon.svg',
                          ),
                        ),
                      ],
                    )),
                  ],
                )),
              ),
              const SizedBox(height: 10),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() =>Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 1),
                    Row(
                      children: [
                        const BaseSvg(svgPath: 'assets/icons/email.svg'),
                        const SizedBox(width: 10),
                        BaseText(
                          controller.profile.value.email??'',
                          fontSize: 13,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                      child: VerticalDivider(color: Colors.black),
                    ),
                    Row(
                      children: [
                        const BaseSvg(svgPath: 'assets/icons/phone-call.svg'),
                        const SizedBox(width: 10),
                        BaseText(
                          "${controller.profile.value.countryCode??''} ${controller.profile.value.phone??''}",
                          fontSize: 13,
                        )
                      ],
                    ),
                    const SizedBox(width: 1),
                  ],
                )),
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,",
                style: TextStyle(
                    height: 1.5,
                    color: textGrayColor,
                    fontSize: 13,
                    letterSpacing: 0.6),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                Get.to(const BookingHistory());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Booking History",
                        style: TextStyle(
                            fontSize: 20,
                            color: blackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDeleteAccountDialogue(context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delete Account",
                        style: TextStyle(
                            fontSize: 20,
                            color: blackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  showLogoutAccountDialogue(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(logoutIc),
                      ),
                      const Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
