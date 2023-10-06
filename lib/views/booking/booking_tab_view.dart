import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/base_widgets/base_dialog.dart';
import 'package:crack_it_user/utils/base_widgets/base_svg.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/utils/constants/base_sizes.dart';
import 'package:crack_it_user/views/booking/booking_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyBookingTabView extends StatefulWidget {
  const MyBookingTabView({super.key});

  @override
  State<MyBookingTabView> createState() => _MyBookingTabViewState();
}

class _MyBookingTabViewState extends State<MyBookingTabView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            onTap: () {
              Get.to(() => const MyBookingDetailsView());
            },
            child: Card(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.green, // Set the desired border color
                        width: 4, // Set the desired border width
                      ),
                    ),
                    //  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Meeting Date",
                                style: TextStyle(
                                    fontSize: 16, color: textGrayColor),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(timeIc),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    "Mon 21 Aug",
                                    style: TextStyle(
                                        fontSize: 18, color: blackColor),
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    alignment: Alignment.center,
                                    child: const CircleAvatar(
                                        radius: 4,
                                        backgroundColor: textGrayColor),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    "8:00 - 8:30 AM",
                                    style: TextStyle(
                                        fontSize: 18, color: blackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          BaseSvg(svgPath: 'assets/icons/dots.svg')
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(manIc1),
                              const SizedBox(width: 12),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jaxen C",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: blackColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Front-end Expert | 5 year",
                                    style: TextStyle(
                                        fontSize: 16, color: textGrayColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Visibility(
                                visible: index == 0 ? true : false,
                                child: Container(
                                    width: 80,
                                    height: 34,
                                    child: const BaseButton(
                                      title: "Pay Now",
                                      fontSize: fs14,
                                    )),
                              ),
                              Visibility(
                                visible: index == 1 ? true : false,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 60,
                                        height: 34,
                                        child: BaseButtonWithoutBackground(
                                          onTap: () {
                                            showBookingCancelDialogue(context);
                                          },
                                          title: "Cancel",
                                          btnColor: whiteColor,
                                          fontSize: fs14,
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        width: 60,
                                        height: 34,
                                        child: const BaseButton(
                                          title: "Chat",
                                          fontSize: fs14,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        );
      }),
    );
  }
}
