import 'package:crack_it_user/base_controller.dart';
import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/base_widgets/base_app_bar.dart';
import '../../utils/base_widgets/base_dialog.dart';
import '../../utils/base_widgets/base_text.dart';
import '../../utils/base_widgets/base_text_field.dart';
import '../../utils/constants/base_images.dart';
import '../../utils/constants/base_sizes.dart';
import 'profile_auth_controller.dart';
import 'category_view.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  ProfileAuthController controller = Get.put(ProfileAuthController());
  BaseController ctrl = Get.find<BaseController>();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.profileFirstName.value.text=ctrl.user?.firstName??'';
    controller.profileLastName.value.text=ctrl.user?.lastName??'';
    controller.profileEmail.value.text=ctrl.user?.email??'';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: "Profile Setup",
        isNotificationVisible: false,
      ),
      body:
         Obx(() =>  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SvgPicture.asset(
                      userIc2,
                      width: 140,
                    ),
                    GestureDetector(
                      onTap: () {
                        showChangeAvtarDialogue(context);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/editIcon.svg',
                      ),
                    ),
                  ],
                )),
                BaseTextField(
                  controller: controller.profileFirstName.value,
                  labelText: 'First Name',
                  topMargin: 70,
                  bottomMargin: 20,
                ),
                BaseTextField(
                  controller: controller.profileLastName.value,
                  labelText: 'Last Name',
                  bottomMargin: 20,
                ),
                BaseTextField(
                  controller: controller.profileEmail.value,
                  labelText: 'Email',
                  readOnly: true,
                  bottomMargin: 20,
                ),
                BaseTextField(
                  controller: controller.profilePhoneNumber.value,
                  labelText: 'Phone Number',
                  textInputType: TextInputType.number,
                  bottomMargin: 20,
                ),
                BaseTextField(
                  controller: controller.profileExperience.value,
                  obscureText: false,
                  bottomMargin: 20,
                  rightMargin: 1,
                  maxLines: 1,
                  labelText: 'Experience',
                  textInputType: TextInputType.text,
                ),
                BaseTextField(
                  controller: controller.profileDescription.value,
                  labelText: 'Description',
                  bottomMargin: 20,
                  maxLines: 4,
                ),
                BaseTextField(
                  controller: controller.profilePrice.value,
                  labelText: 'Price',
                  bottomMargin: 20,
                  textInputType: TextInputType.number,
                ),
                const BaseText(
                  'Language',
                  fontSize: fs17,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisExtent: 40),
                  itemBuilder: (context, index) => Row(
                    children: [
                      Checkbox(
                        activeColor: primaryColor,
                        value: controller.languageList[index]['isSelected'],
                        onChanged: (value) {
                          controller.languageList[index]['isSelected'] = value;
                        },
                      ),
                      BaseText(
                        controller.languageList[index]['language'],
                        fontSize: fs15,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                  shrinkWrap: true,
                  itemCount: 4,
                ),
                const SizedBox(height: 10),
                BaseButton(
                  title: 'CONTINUE',
                  onTap: () {
                    print("controller:${ controller.profileFirstName.value.text}");
                    Get.to(() => const ExpertCategoryView());
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ))
    );
  }
}
