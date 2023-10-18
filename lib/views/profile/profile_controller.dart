import 'package:crack_it_user/views/auth/login_screen/login_screen.dart';
import 'package:get/get.dart';

import '../../backend/api_end_points.dart';
import '../../backend/base_api.dart';
import '../../base_controller.dart';
import '../../response_modal/booking_list_modal.dart';
import '../../response_modal/common_response_modal.dart';
import '../../response_modal/profile_response_modal.dart';
import '../../storage/base_overlays.dart';

class ProfileController extends GetxController {
  Rx<ProfileData> profile = ProfileData().obs;
  RxList<BookingData> list=<BookingData>[].obs;

  Future<void> getProfileDetails() async {
    profile.value = ProfileData();
    await BaseAPI().get(url: ApiEndPoints.userProfile).then((value) {
      if (value != null) {
        ProfileDetails details = ProfileDetails.fromJson(value.data);
        if (details.success ?? false) {
          profile.value = details.data ?? ProfileData();
          BaseOverlays()
              .showSnackBar(message: details.message ?? '', title: "Success");
        } else {
          BaseOverlays()
              .showSnackBar(message: details.message ?? '', title: "Error");
        }
      } else {
        BaseOverlays()
            .showSnackBar(message: "Something went wrong", title: "Error");
      }
    });
  }


  /// Delete account permanent
  Future<void> deleteAccountPermanent() async {
    String userId = Get.find<BaseController>().user?.sId ?? '';
    await BaseAPI()
        .delete(url: ApiEndPoints.deleteAccountPermanent + userId)
        .then((value) {
      if (value != null) {
        CommonResponse response = CommonResponse.fromJson(value.data);
        if (response.success ?? false) {
          BaseOverlays().showSnackBar(
              message: response.message ?? '', title: 'Success');
          Get.offAll(const LoginScreen());
        } else {
          BaseOverlays().showSnackBar(
              message: response.message ?? '', title: 'Error');
        }
      }
    });
  }
  Future<void>getBookingList()async{
    list.clear();
    Map<String,dynamic> param={
      "New":"past",
      "role":Get.find<BaseController>().user?.role??'',
      "userId":Get.find<BaseController>().user?.sId??''
    };
    await BaseAPI().get(url:ApiEndPoints.getBookingList,queryParameters: param).then((value){
      if(value!=null){
        BookingListResponse bookingListResponse=BookingListResponse.fromJson(value.data);
        list.value=bookingListResponse.data??[];
      }
    });
  }
}