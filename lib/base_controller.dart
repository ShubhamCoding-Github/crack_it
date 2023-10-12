import 'package:crack_it_user/response_modal/login_response_modal.dart';
import 'package:crack_it_user/storage/base_shared_preference.dart';
import 'package:crack_it_user/storage/sp_keys.dart';
import 'package:crack_it_user/views/category/controller/category_controller.dart';
import 'package:crack_it_user/views/profile/profile_controller.dart';
import 'package:crack_it_user/views/wallet/controller/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController{
   LoginUser ? user;

   @override
   void onInit() {
      super.onInit();
      WidgetsBinding.instance.addPostFrameCallback((_) async {
         final bool isLoggedIn = await BaseSharedPreference().getBool(SpKeys.isLoggedIn)??false;
         if (isLoggedIn) {
             Map<String,dynamic> data = await BaseSharedPreference().getJson(SpKeys.user);
             user= LoginUser.fromJson(data);
             print("user details---${user?.firstName}");
         }
      });
   }
}
