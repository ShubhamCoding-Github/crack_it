import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/utils/constants/base_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../response_modal/expert_list_modal.dart';
import '../category/controller/category_controller.dart';

class ExpertsProfileView extends StatefulWidget {
  final ExpertData ? data;
  const ExpertsProfileView({super.key,this.data});

  @override
  State<ExpertsProfileView> createState() => _ExpertsProfileViewState();
}

class _ExpertsProfileViewState extends State<ExpertsProfileView> {
  CategoryController controller =Get.find<CategoryController>();

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: BaseAppBar(
        title: 'Profile',
        onBackPressed: (){
          Get.back();
        },
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
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${widget.data?.user?.firstName??''} ${widget.data?.user?.lastName?[0].capitalizeFirst??''}",
                                  style: TextStyle(
                                    fontSize: fs24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    widget.data?.jobCategory?.title??'',
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
                                "${widget.data?.rating??''}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        const Text(
                          "Star Level",
                          style:
                              TextStyle(fontSize: 16, color: textGrayColor),
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
                               // "${widget.data?.expertise?.map((e) => e.title.toString()).toList().join(',')}",
                                "UI/UX",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        const Text(
                          "Expertise",
                          style:
                              TextStyle(fontSize: 16, color: textGrayColor),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children:  [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "${widget.data?.experience??''} yrs",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        const Text(
                          "Experience",
                          style:
                              TextStyle(fontSize: 16, color: textGrayColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Expertise",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
               Text(widget.data?.description??'',
                 style: TextStyle(color: textGrayColor, fontSize: 15),
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
                      "Description",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
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
                      widget.data?.expertise?.length??0,
                      (index) => Container(
                            margin:
                                EdgeInsets.only(right: 8, top: 8, bottom: 8),
                            padding: EdgeInsets.symmetric(
                                horizontal: 13, vertical: 6),
                            decoration: BoxDecoration(
                                color: backgroundGrayColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(widget.data?.expertise?[index].title??''),
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
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
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
                          languageList.length,
                          (index) => Container(
                                margin: EdgeInsets.only(
                                    right: 8, top: 8, bottom: 8),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 6),
                                decoration: BoxDecoration(
                                    color: backgroundGrayColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(categoryList[index]),
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
                      "\$${widget.data?.price??''}/hr",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BaseButton(
                title: "REQUEST",
                onTap: () {
                  controller.createBooking(expertId:widget.data?.user?.sId??'');
                },
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
