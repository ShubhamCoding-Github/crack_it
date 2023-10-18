import 'package:animate_do/animate_do.dart';
import 'package:crack_it_user/utils/base_widgets/base_animated_column.dart';
import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/base_widgets/base_svg.dart';
import 'package:crack_it_user/utils/base_widgets/base_text.dart';
import 'package:crack_it_user/utils/base_widgets/base_text_field.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/utils/constants/base_sizes.dart';
import 'package:crack_it_user/utils/constants/base_strings.dart';
import 'package:crack_it_user/views/auth/controller/login_controller.dart';
import 'package:crack_it_user/views/auth/forgot_password_screen.dart';
import 'package:crack_it_user/views/auth/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../storage/base_shared_preference.dart';
import '../../../storage/sp_keys.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRole();
  }
   Future<void> getRole()async{
   controller.role.value= await BaseSharedPreference().getString(SpKeys.role)??'';
   }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: scaffoldHorizontalPadding),
          child: BaseAnimatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            scrollable: true,
            children: [
              const Align(
                alignment: Alignment.center,
                child: BaseSvg(svgPath: appLogo, topMargin: 130),
              ),
              const BaseText(
                topMargin: 120,
                strHelloAgain,
                fontWeight: FontWeight.w700,
                fontSize: fs28,
              ),
              const BaseText(strWelcomeBackYouHaveBeenMissed,
                  fontSize: fs17, fontWeight: FontWeight.w300, topMargin: 10),
              BaseTextField(
                topMargin: 40,
                rightMargin: 1,
                labelText: strEmail,
                textInputType: TextInputType.emailAddress,
                controller: controller.emailCtrl,
              ),
              Obx(() =>BaseTextField(
                topMargin: 20,
                rightMargin: 1,
                labelText: strPassword,
                obscureText: controller.hidePassword.value,
                maxLines: 1,
                suffix: GestureDetector(
                  onTap: () {
                    controller.hidePassword.value = !controller.hidePassword.value;
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: BaseSvg(svgPath: icEye),
                  ),
                ),
                controller: controller.passwordCtrl,
              )),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Get.to(() => const ForgotPasswordScreen());
                  },
                  child: const BaseText(strForgotPassword,
                      topMargin: 20,
                      fontSize: fs17,
                      fontWeight: FontWeight.w500),
                ),
              ),
              BaseButton(
                topMargin: 30,
                bottomMargin: 20,
                title: strCapsLogin,
                onTap: () {
                  if(controller.emailCtrl.text.isNotEmpty&&controller.passwordCtrl.text.isNotEmpty){
                    controller.login();
                  }
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar:
      Obx(() => Visibility(
         visible:  controller.role.value=='user',
         child: FadeInUp(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                            text: strDontHaveAnAccount,
                            style: TextStyle(fontSize: fs16)),
                        TextSpan(
                          text: strSignUp,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(const SignUpScreen());

                            },
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: fs16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
       )),
      );
  }
}
