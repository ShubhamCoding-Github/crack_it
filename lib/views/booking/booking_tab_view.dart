import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/base_widgets/base_dialog.dart';
import 'package:crack_it_user/utils/base_widgets/base_svg.dart';
import 'package:crack_it_user/utils/base_widgets/base_utility.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/utils/constants/base_sizes.dart';
import 'package:crack_it_user/views/booking/booking_details_view.dart';
import 'package:crack_it_user/views/dashboard/controller/dashboard_controller.dart';
import 'package:crack_it_user/views/payment/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../base_controller.dart';

class MyBookingTabView extends StatefulWidget {
  const MyBookingTabView({super.key});

  @override
  State<MyBookingTabView> createState() => _MyBookingTabViewState();
}

class _MyBookingTabViewState extends State<MyBookingTabView> {
  DashBoardController controller=Get.find<DashBoardController>();
  String role='';
  @override
  Widget build(BuildContext context) {
    role=Get.find<BaseController>().user?.role??'';
    return Obx(() => ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: controller.list.length,
        itemBuilder:(BuildContext context,int index){
       return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
          onTap: () {
            Get.to(() => MyBookingDetailsView(id: controller.list[index].sId!));
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
                                 Text(
                                  controller.list[index].date!=null?getFormattedMonth(controller.list[index].date!):'',
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
                                 Text(
                                  "${controller.list[index].startTime!=null?getFormattedTime3(controller.list[index].startTime!):""} - ${controller.list[index].endTime!=null?getFormattedTime3(controller.list[index].endTime!):""}",
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
                    Visibility(
                        visible: role.toUpperCase()=='USER',
                      replacement: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(manIc1),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${controller.list[index].user?.firstName??''} ${controller.list[index].user?.lastName?[0].capitalizeFirst??''}",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: blackColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.list[index].jobCategory?.title??'',
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
                                visible: true,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 60,
                                        height: 34,
                                        child: BaseButtonWithoutBackground(
                                          onTap: () {
                                            showBookingCancelDialogue(context,onTap:(){
                                              Get.back();
                                              controller.cancelBooking(id:controller.list[index].sId!);
                                            });
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(manIc1),
                              const SizedBox(width: 12),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${controller.list[index].expert?.firstName??''} ${controller.list[index].expert?.lastName?[0].capitalizeFirst??''}",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: blackColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${controller.list[index].jobCategory?.title??''} | ${controller.list[index].expertData?.experience??''} year",
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
                                visible: true,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 60,
                                        height: 34,
                                        child: BaseButtonWithoutBackground(
                                          onTap: () {
                                            showBookingCancelDialogue(context,onTap:(){
                                              Get.back();
                                              controller.cancelBooking(id:controller.list[index].sId!);
                                            });
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
                    ),
                  ],
                )),
          ),
        ),
      );
     }
    )
    );
  }
}
