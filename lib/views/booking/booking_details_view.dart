import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/base_widgets/base_utility.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/views/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class MyBookingDetailsView extends StatefulWidget {
  final String id;
  const MyBookingDetailsView({super.key,required this.id});

  @override
  State<MyBookingDetailsView> createState() => _MyBookingDetailsViewState();
}

class _MyBookingDetailsViewState extends State<MyBookingDetailsView> {
  DashBoardController controller=Get.find<DashBoardController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getBookingDetails(id:widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  BaseAppBar(
        title: "Booking Details",
        onBackPressed: (){
          Get.back();
        },
      ),
      body:Obx(() => Padding(
        padding: const EdgeInsets.only(left: 20, top: 38, right: 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Booking Info",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                  width: 120,
                  height: 34,
                  child:  BaseButtonWithoutBackground(
                    btnRadius: 19,
                    title:controller.data.value.booking?.booking?.status??'',
                    btnColor: whiteColor,
                  ))
            ],
          ),
          Container(
            //  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 29),

            margin: const EdgeInsets.symmetric(vertical: 17),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 7,
                    offset: Offset(0, 2),
                  ),
                ]),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 29),
                  decoration: BoxDecoration(
                    color: backgroundGrayColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(timeInCircleIc),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              baseTextRow(
                                  title1: "Date & Time",
                                  fontWeight: FontWeight.w800),
                              baseTextRow(title1: controller.data.value.booking?.booking?.date!=null?getFormattedMonth(controller.data.value.booking!.booking!.date!):''),
                              baseTextRow(title1:"${controller.data.value.booking?.booking?.startTime!=null?getFormattedTime3(controller.data.value.booking!.booking!.startTime!):""} - ${controller.data.value.booking?.booking?.endTime!=null?getFormattedTime3(controller.data.value.booking!.booking!.endTime!):""}",
                              )
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(chatInCircleIc),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              baseTextRow(
                                  title1: "Booking Type",
                                  fontWeight: FontWeight.w800),
                              baseTextRow(title1: "Chat"),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    children: [
                      baseTextRow(
                          title1: 'Service Provider Info', fontSize: 18),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                manIc1,
                                width: 60,
                              ),
                              const SizedBox(width: 12),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${controller.data.value.booking?.booking?.expert?.firstName??''} ${controller.data.value.booking?.booking?.expert?.lastName?[0].capitalizeFirst??''}",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: blackColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${controller.data.value.expertProfile?.jobCategory?.title??''} | ${controller.data.value.expertProfile?.experience??''} year",
                                    style: TextStyle(
                                        fontSize: 16, color: textGrayColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          baseTextRow(title1: 'Payment Info', fontSize: 20),
          baseTextRow(title1: 'Total Price', title2:controller.data.value.expertProfile?.price!=null? controller.data.value.expertProfile!.price.toString():""),
          baseTextRow(title1: 'Tax', title2: '0.00'),
          const Divider(
            thickness: 1,
          ),
          baseTextRow(
              title1: 'Payment Total',
              title2: "${controller.data.value.expertProfile?.price!=null? controller.data.value.expertProfile?.price.toString():""}",
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ]),
      )),
    );
  }

  Widget baseTextRow(
      {String? title1,
      String? title2,
      FontWeight? fontWeight,
      double? fontSize}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title1 ?? "",
            style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          ),
          title2 == null
              ? const SizedBox()
              : Text(
                  "\$$title2",
                  style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
                ),
        ],
      ),
    );
  }
}
