import 'package:crack_it_user/backend/api_end_points.dart';
import 'package:crack_it_user/response_modal/sign_up_modal.dart';
import 'package:crack_it_user/views/auth/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../backend/base_api.dart';
import '../../../storage/base_overlays.dart';

class SignUpController extends GetxController{
  Rx<TextEditingController> firstName=TextEditingController().obs;
  Rx<TextEditingController> lastName=TextEditingController().obs;
  Rx<TextEditingController> phone=TextEditingController().obs;
  Rx<TextEditingController> email=TextEditingController().obs;
  Rx<TextEditingController> password=TextEditingController().obs;
  Rx<TextEditingController> confirmPassword=TextEditingController().obs;
  RxBool isAccept=true.obs;

  Future<void> register()async {
    Map<String,dynamic> param={
      "firstName":firstName.value.text.trim().capitalizeFirst,
      "lastName":lastName.value.text.trim().capitalizeFirst,
      "email":email.value.text.trim(),
      "countryCode":"+91",
      "phone":phone.value.text,
      "password":password.value.text,
      "termAndConditions":isAccept.value
    };
   BaseAPI().post(url:ApiEndPoints.createUser,data: param).then((value) {
     if(value!=null){
       SignUpResponse response=SignUpResponse.fromJson(value.data);
       if(response.success??false){
         Get.offAll(const LoginScreen());
         BaseOverlays().showSnackBar(message:response.message??'',title: "Success");
       }else{
         BaseOverlays().showSnackBar(message:response.message??'');
       }
     }
   });
  }
}