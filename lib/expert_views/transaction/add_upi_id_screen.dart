
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/base_widgets/base_app_bar.dart';
import '../../utils/base_widgets/base_button.dart';
import '../../utils/base_widgets/base_text.dart';
import '../../utils/base_widgets/base_text_field.dart';
import '../../utils/constants/base_sizes.dart';
import 'add_bank_controller.dart';

class AddUPIScreen extends StatefulWidget {
  const AddUPIScreen({super.key});

  @override
  State<AddUPIScreen> createState() => _AddUPIScreenState();
}

class _AddUPIScreenState extends State<AddUPIScreen> {
  AddBankController controller=Get.put(AddBankController());
  Rx<TextEditingController> upiID = TextEditingController().obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: "Add UPI Id",
        isNotificationVisible: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            BaseTextField(
              controller: upiID.value,
              labelText: 'UPI Id',
              bottomMargin: 20,
            ),
            const Spacer(),
            BaseButton(
              bottomMargin: 40,
              title: 'SAVE',
              onTap: () {
                Map param = {
                  "user": "64f6cbc30c64f2d23d76cd11",
                  "type": "UPI",
                  "upiId": upiID.value,
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
