
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/base_widgets/base_app_bar.dart';
import '../../utils/base_widgets/base_button.dart';
import '../../utils/base_widgets/base_text.dart';
import '../../utils/base_widgets/base_text_field.dart';
import '../../utils/constants/base_sizes.dart';

class AddUPIScreen extends StatefulWidget {
  const AddUPIScreen({super.key});

  @override
  State<AddUPIScreen> createState() => _AddUPIScreenState();
}

class _AddUPIScreenState extends State<AddUPIScreen> {
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
              labelText: 'UPI Id',
              bottomMargin: 20,
            ),
            const Spacer(),
            BaseButton(
              bottomMargin: 40,
              title: 'SAVE',
              onTap: () {
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
