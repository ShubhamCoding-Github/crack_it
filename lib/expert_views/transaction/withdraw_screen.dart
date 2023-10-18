import '../../utils/base_widgets/base_app_bar.dart';
import '../../utils/base_widgets/base_button.dart';
import '../../utils/base_widgets/base_dialog.dart';
import '../../utils/base_widgets/base_text.dart';
import '../../utils/base_widgets/base_text_field.dart';
import '../../utils/constants/base_colors.dart';
import '../../utils/constants/base_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'add_bank_account_screen.dart';
import 'add_upi_id_screen.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {


  List<bool> radioList = [true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(
        onBackPressed:() {
          Get.back();
        },
        title: "Withdraw Amount",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const BaseTextField(
              labelText: 'Amount',
              bottomMargin: 30,
              maxLines: 1,
              textInputType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Bank Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    width: 80,
                    height: 34,
                    child: BaseButton(
                      onTap: () {
                        Get.to(() => AddBankScreen());
                      },
                      title: "Add New",
                      fontSize: fs14,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: const EdgeInsets.only(
                      left: 20, right: 10, top: 20, bottom: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          detailRow('Bank Name'),
                          detailRow('Account Name'),
                          detailRow('Account Number'),
                          detailRow('IFSC Code'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          detailRow2('Bank Of Baroda'),
                          detailRow2('Jaxen C'),
                          detailRow2('5465 3265 6598'),
                          detailRow2('02154IJHG0'),
                        ],
                      ),
                      Radio(
                        value: false,
                        groupValue: true,
                        onChanged: (value) {},
                        activeColor: primaryColor,
                      )
                    ],
                  )),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "UPI Id",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    width: 80,
                    height: 34,
                    child: BaseButton(
                      onTap: () {
                        Get.to(() => AddUPIScreen());
                      },
                      title: "Add New",
                      fontSize: fs14,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            ListView.builder(
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    padding: const EdgeInsets.only(
                        left: 20, right: 10, top: 10, bottom: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/upi-ar21.svg'),
                            const SizedBox(width: 10),
                            const BaseText(
                              'jeremy89@okicici',
                              fontSize: fs17,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                        Radio(
                          value: true,
                          groupValue: radioList[index],
                          onChanged: (value) {
                            setState(() {
                              radioList[0] = false;
                              radioList[1] = false;

                              radioList[index] = true;
                            });
                            print(radioList);
                          },
                          activeColor: primaryColor,
                        )
                      ],
                    )),
              ),
              itemCount: 2,
              shrinkWrap: true,
            ),
            const Spacer(),
            const BaseText(
              '\$568',
              fontSize: fs30,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
            const SizedBox(
              height: 20,
            ),
            BaseButton(
              bottomMargin: 40,
              title: 'WITHDRAW',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget detailRow(title) {
    return Row(
      children: [
        BaseText(
          title,
          fontSize: fs16,
          fontWeight: FontWeight.normal,
          bottomMargin: 10,
        ),
      ],
    );
  }

  Widget detailRow2(body) {
    return Row(
      children: [
        BaseText(
          body,
          fontSize: fs16,
          fontWeight: FontWeight.bold,
          bottomMargin: 10,
        ),
      ],
    );
  }
}
