
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/base_widgets/base_app_bar.dart';
import '../../utils/base_widgets/base_svg.dart';
import '../../utils/base_widgets/base_text.dart';
import '../../utils/base_widgets/base_utility.dart';
import '../../utils/constants/base_colors.dart';
import '../../utils/constants/base_images.dart';
import '../../utils/constants/base_sizes.dart';
import '../dashboard/controller/dashboard_controller.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  DashBoardController controller=Get.find<DashBoardController>();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          extendBody: true,
            appBar:  BaseAppBar(
              onBackPressed: (){
                Get.back();
              },
              title: "Bookings History",
            ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                 physics:const ScrollPhysics() ,
                 scrollDirection: Axis.vertical,
                 itemCount: controller.list.length,
                 itemBuilder:(BuildContext context,int index){
                   return Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10),
                     child: GestureDetector(
                       onTap: () {
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
                                               style: const TextStyle(
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
                                               style: const TextStyle(
                                                   fontSize: 18, color: blackColor),
                                             ),
                                           ],
                                         ),
                                       ],
                                     ),
                                     const BaseSvg(svgPath: 'assets/icons/dots.svg')
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
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text(
                                               "${controller.list[index].expert?.firstName??''} ${controller.list[index].expert?.lastName?[0].capitalizeFirst??''}",
                                               style: const TextStyle(
                                                   fontSize: 24,
                                                   color: blackColor,
                                                   fontWeight: FontWeight.bold),
                                             ),
                                             Text(
                                               "${controller.list[index].jobCategory?.title??''} | ${controller.list[index].expertData?.experience??''} year",
                                               style: const TextStyle(
                                                   fontSize: 16, color: textGrayColor),
                                             ),
                                           ],
                                         ),
                                       ],
                                     ),
                                     Row(
                                       children: [
                                         BaseText(
                                           (controller.list[index].status??''),
                                           color: redColor,
                                           fontSize: fs14,
                                           fontWeight: FontWeight.w500,
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
                 }
            ),
        ]),
          )));
  }
}
