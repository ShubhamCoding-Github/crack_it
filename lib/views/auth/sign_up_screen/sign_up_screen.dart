import 'package:animate_do/animate_do.dart';
import 'package:crack_it_user/utils/base_widgets/base_animated_column.dart';
import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/base_widgets/base_checkbox.dart';
import 'package:crack_it_user/utils/base_widgets/base_svg.dart';
import 'package:crack_it_user/utils/base_widgets/base_text.dart';
import 'package:crack_it_user/utils/base_widgets/base_text_field.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/utils/constants/base_sizes.dart';
import 'package:crack_it_user/utils/constants/base_strings.dart';
import 'package:crack_it_user/views/auth/controller/signUp_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../storage/base_overlays.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController controller=Get.put(SignUpController());
  bool checkBoxValue = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
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
              strRegister,
              topMargin: 40,
              fontWeight: FontWeight.w700,
              fontSize: fs28,
            ),
            const BaseText(
              strCreateYourAccount,
              fontSize: fs17,
              fontWeight: FontWeight.w300,
              topMargin: 10,
            ),
            BaseTextField(
              controller:controller.firstName.value,
              topMargin: 30,
              rightMargin: 1,
              labelText: strFirstName,
              textInputType: TextInputType.name,
            ),
             BaseTextField(
              controller:controller.lastName.value,
              topMargin: 20,
              rightMargin: 1,
              labelText: strLastName,
              textInputType: TextInputType.name,
            ),
            BaseTextField(
              controller:controller.email.value,
              topMargin: 20,
              rightMargin: 1,
              labelText: strEmail,
              textInputType: TextInputType.emailAddress,
            ),
            BaseTextField(
              controller:controller.phone.value,
              topMargin: 20,
              rightMargin: 1,
              labelText: strPhoneNumber,
              textInputType: TextInputType.phone,
            ),
            BaseTextField(
              controller:controller.password.value,
              topMargin: 20,
              rightMargin: 1,
              labelText: strPassword,
              obscureText: isPasswordVisible,
              textInputType: TextInputType.visiblePassword,
              suffix: GestureDetector(
                onTap: () {
                  isPasswordVisible = !isPasswordVisible;
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: BaseSvg(svgPath: icEye),
                ),
              ),
            ),
            BaseTextField(
              controller:controller.confirmPassword.value,
              topMargin: 20,
              rightMargin: 1,
              obscureText: isConfirmPasswordVisible,
              labelText: strConfirmPassword,
              textInputType: TextInputType.visiblePassword,
              suffix: GestureDetector(
                onTap: () {
                  isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: BaseSvg(svgPath: icEye),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Obx(() =>BaseCheckbox(
                    rightMargin: 10,
                    value: controller.isAccept.value,
                    onChanged: () {
                      controller.isAccept.value=!controller.isAccept.value;
                    },
                  )),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: strBySigningUp),
                          TextSpan(
                            text: strTermsConditions,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // On Tap
                              },
                          ),
                          const TextSpan(text: strSmallAnd),
                          TextSpan(
                            text: strPrivacyPolicy,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // On Tap
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BaseButton(
              topMargin: 20,
              bottomMargin: 20,
              title: strCapsSignUp,
              onTap: () {
                if(controller.isAccept.value){
                  controller.register();
                }else{
                  BaseOverlays().showSnackBar(message:"Please accept Our Term & Conditions");
                }
              },
            ),
            const Center(
              child: BaseText('or', fontSize: fs17),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              height: 65,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseSvg(svgPath: 'assets/icons/search.svg'),
                  SizedBox(
                    width: 15,
                  ),
                  BaseText(
                    'SIGN UP WITH GOOGLE',
                    fontSize: fs15,
                  )
                ],
              ),
            ),
            FadeInUp(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                              text: strIHaveAnAccount,
                              style: TextStyle(fontSize: fs16)),
                          TextSpan(
                            text: strLogin,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.back();
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
          ],
        ),
      ),
      // bottomNavigationBar:
    );
  }
}
