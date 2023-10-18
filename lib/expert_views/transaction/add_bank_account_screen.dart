
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/base_widgets/base_app_bar.dart';
import '../../utils/base_widgets/base_button.dart';
import '../../utils/base_widgets/base_text.dart';
import '../../utils/base_widgets/base_text_field.dart';
import '../../utils/constants/base_sizes.dart';
import 'add_bank_controller.dart';

class AddBankScreen extends StatefulWidget {
  const AddBankScreen({super.key});

  @override
  State<AddBankScreen> createState() => _AddBankScreenState();
}

class _AddBankScreenState extends State<AddBankScreen> {
  AddBankController controller=Get.put(AddBankController());
  Rx<TextEditingController> bankName = TextEditingController().obs;
  Rx<TextEditingController> accountName = TextEditingController().obs;
  Rx<TextEditingController> accountNumber = TextEditingController().obs;
  Rx<TextEditingController> ifscCode = TextEditingController().obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        onBackPressed: (){
          Get.back();
        },
        title: "Add Bank Details",
        isNotificationVisible: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
          BaseTextField(
              controller: bankName.value,
              labelText: 'Bank Name',
              bottomMargin: 20,
            ),
          BaseTextField(
            controller: accountName.value,
              labelText: 'Account Name',
              bottomMargin: 20,
            ),
            BaseTextField(
              controller: accountNumber.value,
              labelText: 'Account Number',
              bottomMargin: 20,
            ),
             BaseTextField(
              controller: ifscCode.value,
              labelText: 'IFSC Code',
              bottomMargin: 20,
            ),
            const Spacer(),
            BaseButton(
              bottomMargin: 40,
              title: 'SAVE',
              onTap: () {
                Map<String, dynamic> param = {
                  "bankName": bankName.value,
                  "accountName": accountName.value,
                  " accountNo": accountNumber.value,
                  "ifscCode": ifscCode.value,
                };
                controller.postProfileDetails(param: param);
                Get.back();
              },
            ),
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
