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


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  RecoveryController controller = Get.find<RecoveryController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.password.value.clear();
    controller.confirmPassword.value.clear();
  }
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
                'Reset Password?',
                topMargin: 80,
                fontWeight: FontWeight.w700,
                fontSize: fs28,
              ),
              const BaseText('Create new password',
                  fontSize: fs17, fontWeight: FontWeight.w300, topMargin: 10),
             Obx(() => BaseTextField(
                obscureText: controller.hideResetPassword.value,
                topMargin: 20,
                controller: controller.password.value,
                rightMargin: 1,
                maxLines: 1,
                labelText: strPassword,
                textInputType: TextInputType.visiblePassword,
                suffix: GestureDetector(
                  onTap: () {
                    controller.hideResetPassword.value = !controller.hideResetPassword.value;
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: BaseSvg(svgPath: icEye),
                  ),
                ),
              )),
              Obx(() => BaseTextField(
                obscureText: controller.hideConfirmResetPassword.value,
                topMargin: 20,
                controller: controller.confirmPassword.value,
                rightMargin: 1,
                maxLines: 1,
                labelText: strConfirmPassword,
                textInputType: TextInputType.visiblePassword,
                suffix: GestureDetector(
                  onTap: () {
                    controller.hideConfirmResetPassword.value = !controller.hideConfirmResetPassword.value;
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: BaseSvg(svgPath: icEye),
                  ),
                ),
              )),
              BaseButton(
                topMargin: 20,
                bottomMargin: 80,
                title: 'SUBMIT',
                onTap: () {
                 controller.resetPassword();
                },
              ),
            ],
          ),
        ),
      );
  }
}
