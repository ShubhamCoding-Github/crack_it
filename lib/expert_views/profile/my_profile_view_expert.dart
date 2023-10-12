
import 'package:crack_it_user/expert_views/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/base_widgets/base_app_bar.dart';
import '../../utils/base_widgets/base_button.dart';
import '../../utils/base_widgets/base_dialog.dart';
import '../../utils/constants/base_colors.dart';
import '../../utils/constants/base_images.dart';
import '../../utils/constants/base_sizes.dart';

class MyProfileViewExpert extends StatefulWidget {
  const MyProfileViewExpert({super.key});

  @override
  State<MyProfileViewExpert> createState() => _MyProfileViewExpertState();
}

class _MyProfileViewExpertState extends State<MyProfileViewExpert> {
  ExpertProfileController controller=Get.put(ExpertProfileController());
  List<String> categoryList = [
    'HTML',
    'CSS',
    'JavaScript',
    'React',
    'Angular',
    'Vue.js',
    'Bootstrap',
    'Material Design',
    'Sass',
    'Less',
    'TypeScript',
  ];

  List<String> languageList = [
    'English',
    'French',
    'German',
  ];

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
          child:Obx(() => Column(
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
                          child:  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${controller.profile.value.expert?.user?.firstName??''} ${controller.profile.value.expert?.user?.lastName?[0].capitalizeFirst??''}",
                                  style: TextStyle(
                                    fontSize: fs24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    controller.profile.value.expert?.jobCategory?.title??'',
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(starIc),
                             Padding(
                              padding: EdgeInsets.all(13.0),
                              child: Text(
                                controller.profile.value.rating!=null?controller.profile.value.rating.toString():'',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        const Text(
                          "Star Level",
                          style: TextStyle(fontSize: 16, color: textGrayColor),
                        )
                      ],
                    ),
                    const Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "UI/UX",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "Expertise",
                          style: TextStyle(fontSize: 16, color: textGrayColor),
                        )
                      ],
                    ),
                     Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "${controller.profile.value.expert?.experience??''} yrs",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "Experience",
                          style: TextStyle(fontSize: 16, color: textGrayColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
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
               Text(
                 controller.profile.value.expert?.description??'',
                style: TextStyle(
                    color: textGrayColor, fontSize: 15, letterSpacing: 0.6),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Expertise",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: List.generate(
                      controller.profile.value.expert?.expertise?.length??0,
                      (index) => Container(
                            margin:
                                EdgeInsets.only(right: 8, top: 8, bottom: 8),
                            padding: EdgeInsets.symmetric(
                                horizontal: 13, vertical: 6),
                            decoration: BoxDecoration(
                                color: backgroundGrayColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(controller.profile.value.expert?.expertise?[index].title??''),
                          )),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Language",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: List.generate(
                          controller.profile.value.expert?.languages?.length??0,
                          (index) => Container(
                                margin: EdgeInsets.only(
                                    right: 8, top: 8, bottom: 8),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 6),
                                decoration: BoxDecoration(
                                    color: backgroundGrayColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(controller.profile.value.expert?.languages?[index]??''),
                              )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      "\$ ${controller.profile.value.expert?.price!=null?controller.profile.value.expert?.price.toString():''}/hr",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  // showDeleteAccountDialogue(context);
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
              BaseButton(
                topMargin: 20.0,
                title: "EDIT",
                onTap: () {},
              ),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
