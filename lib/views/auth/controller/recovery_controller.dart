import 'package:crack_it_user/response_modal/common_response_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../backend/api_end_points.dart';
import '../../../backend/base_api.dart';
import '../../../storage/base_overlays.dart';
import '../../../storage/base_shared_preference.dart';
import '../../../storage/sp_keys.dart';
import '../login_screen/login_screen.dart';
import '../reset_password_screen.dart';
import '../verify_screen.dart';

class RecoveryController extends GetxController{
Rx<TextEditingController> mobileNo=TextEditingController().obs;
Rx<TextEditingController> otp=TextEditingController().obs;
Rx<TextEditingController> password=TextEditingController().obs;
Rx<TextEditingController> confirmPassword=TextEditingController().obs;
RxBool hideResetPassword = false.obs;
RxBool hideConfirmResetPassword = false.obs;
  Future<void>sendOtp()async{
    Map<String,dynamic> param={
      "mobile":mobileNo.value.text,
      "countryCode":"+91"
    };
    await BaseAPI().post(url:ApiEndPoints.sendOtp,data: param).then((value) {
      if(value!=null){
        CommonResponse response=CommonResponse.fromJson(value.data);
        if(response.success??false){
          Get.to(() => const VerifyScreen());
          BaseOverlays().showSnackBar(message:response.message??'',title: "Success");
        }else{
          BaseOverlays().showSnackBar(message:response.message??'',title: "Error");
        }
      }
    });
  }

Future<void>verifyOtp()async{
  Map<String,dynamic> param={
    "mobile":int.parse(mobileNo.value.text.trim()),
    "countryCode":"+91",
    "otp":int.parse(otp.value.text.trim())
  };
  await BaseAPI().post(url:ApiEndPoints.verifyOtp,data: param).then((value) {
    if(value!=null){
      CommonResponse response=CommonResponse.fromJson(value.data);
      if(response.success??false){
        print("token--${response.data['token']}");
        BaseSharedPreference().setString(SpKeys.apiToken,response.data['token']??'');
        Get.to(() => const ResetPasswordScreen());
        BaseOverlays().showSnackBar(message:response.message??'',title: "Success");
      }else{
        BaseOverlays().showSnackBar(message:response.message??'',title: "Error");
      }
    }
  });
}

Future<void>resetPassword()async{
  Map<String,dynamic> param={
    "password":password.value.text
  };
  await BaseAPI().post(url:ApiEndPoints.setPassword,data: param).then((value) {
    if(value!=null){
      CommonResponse response=CommonResponse.fromJson(value.data);
      if(response.success??false){
        Get.offAll(() => const LoginScreen());
        BaseOverlays().showSnackBar(message:response.message??'',title: "Success");
      }else{
        BaseOverlays().showSnackBar(message:response.message??'',title: "Error");
      }
    }
  });
}
}