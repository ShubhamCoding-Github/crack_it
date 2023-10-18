import 'package:crack_it_user/utils/base_widgets/base_animated_column.dart';
import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/base_widgets/base_svg.dart';
import 'package:crack_it_user/utils/base_widgets/base_text.dart';
import 'package:crack_it_user/utils/base_widgets/base_text_field.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/utils/constants/base_sizes.dart';
import 'package:crack_it_user/utils/constants/base_strings.dart';
import 'package:crack_it_user/views/auth/controller/recovery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  RecoveryController controller=Get.put(RecoveryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(isNotificationVisible: false),
      // extendBodyBehindAppBar: true,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: scaffoldHorizontalPadding),
        child: BaseAnimatedColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          scrollable: true,
          children: [
            const Align(
              alignment: Alignment.center,
              child: BaseSvg(svgPath: appLogo, topMargin: 30),
            ),
            const BaseText(
              strForgotPassword,
              topMargin: 80,
              fontWeight: FontWeight.w700,
              fontSize: fs28,
            ),
            const BaseText(strEnterDetail,
                fontSize: fs17, fontWeight: FontWeight.w300, topMargin: 10),
            BaseTextField(
              topMargin: 40,
              controller: controller.mobileNo.value,
              rightMargin: 1,
              labelText: strPhoneNumber,
              textInputType: TextInputType.phone,
            ),
            BaseButton(
              topMargin: 20,
              bottomMargin: 80,
              title: strCapsContinue,
              onTap: () {
               controller.sendOtp();
              },
            ),
          ],
        ),
      ),
    );
  }
}
