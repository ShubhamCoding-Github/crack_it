import 'package:crack_it_user/views/auth/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../storage/base_shared_preference.dart';
import '../../../storage/sp_keys.dart';
import '../../../utils/constants/base_colors.dart';
import '../../../utils/constants/base_images.dart';

class ChooseRole extends StatefulWidget {
  const ChooseRole({super.key});

  @override
  State<ChooseRole> createState() => _ChooseRoleState();
}

class _ChooseRoleState extends State<ChooseRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            logoPng,
            scale: 2.6,
          ),
          SizedBox(
            height: Get.height * 0.120,
          ),
          const Text(
            "Choose role",
            style:
            TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  BaseSharedPreference().setString(SpKeys.role,'user');
                  Get.offAll(const LoginScreen());
                },
                child: Container(
                  height: Get.height * 0.20,
                  width: Get.width*0.40,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 7,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color:Colors.white),
             child: const Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Icon(Icons.person,size: 50,color: primaryColor),
                    Text(
                      "User",
                      style:
                      TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.normal),
                    ),
                  ],
             ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  BaseSharedPreference().setString(SpKeys.role,'expert');
                  Get.offAll(const LoginScreen());
                },
                child: Container(
                  height: Get.height * 0.20,
                  width: Get.width*0.40,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 7,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_search,size: 50,color: primaryColor,),
                      Text(
                        "Expert",
                        style:
                        TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
