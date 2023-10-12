import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/views/wallet/controller/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../base_controller.dart';
import '../../expert_views/transaction/withdraw_screen.dart';
import '../../utils/base_widgets/base_text.dart';
import '../../utils/constants/base_sizes.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  WalletController controller=Get.put(WalletController());
  String role='';
@override
  void initState() {
    super.initState();
    print("called init");
    controller.getWalletBalance();
    controller.getPayments();
  }
  @override
  Widget build(BuildContext context) {
    role=Get.find<BaseController>().user?.role??'';
    return Scaffold(
      appBar:  BaseAppBar(
        title: role.toUpperCase()=="USER"?"Wallet":"Transaction History",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: SvgPicture.asset(
                      "assets/icons/Group 275.svg",
                      fit: BoxFit.fill,
                    )),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: Row(
                      children:[
                        Column(
                        children: [
                          Text(
                            role.toUpperCase()=="USER"?"Wallet Amount":"Total Earning",
                            style: TextStyle(color: whiteColor, fontSize: 16),
                          ),
                          SizedBox(height: 10),
                         Obx(() =>  Text(
                            "\$ ${controller.walletAmount.value}",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ))
                        ],
                      ),
                        if(role.toUpperCase()!="USER")...[
                        const SizedBox(
                          width: 180,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const WithdrawScreen());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(15)),
                            height: 30,
                            width: 95,
                            child: const BaseText(
                              'Withdraw',
                              color: primaryColor,
                              fontSize: fs15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                        ]
                      ],
                    ))
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Transactions",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Obx(() =>Expanded(
             child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.list.length,
                    itemBuilder: (BuildContext context,int index){
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      walletTnxIc,
                                      width: 60,
                                    ),
                                    const SizedBox(width: 12),
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.list[index].booking?.expert?.firstName??''} ${controller.list[index].booking?.expert?.lastName?[0].capitalizeFirst??''}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: blackColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 4),
                                          child: Text(
                                            "My progress getting better. Thank you",
                                            style: TextStyle(fontSize: 14, color: textGrayColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    index.isEven
                                        ?  Text(
                                      "+\$ ${controller.list[index].grandTotal.toString()}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: primaryColor,
                                          fontWeight: FontWeight.normal),
                                    )
                                        :  Column(
                                      children: [
                                        Text(
                                          "Pending",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: greyColor2,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          "\$ ${controller.list[index].grandTotal.toString()}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: orangeColor,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          )
                        ],
                      );
                }),
           )),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
