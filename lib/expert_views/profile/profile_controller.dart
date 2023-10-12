import 'package:get/get.dart';

import '../../backend/api_end_points.dart';
import '../../backend/base_api.dart';
import '../../base_controller.dart';
import '../../response_modal/booking_list_modal.dart';
import '../../response_modal/expert_profile_modal.dart';
import '../../response_modal/profile_response_modal.dart';
import '../../storage/base_overlays.dart';

class ExpertProfileController extends GetxController {
  Rx<ExpertProfileData> profile = ExpertProfileData().obs;

  Future<void> getProfileDetails() async {
    profile.value = ExpertProfileData();
    String userId=Get.find<BaseController>().user?.sId??'';
    await BaseAPI().get(url: ApiEndPoints.getExpertProfile+userId).then((value) {
      if (value != null) {
        ExpertProfileResponse details = ExpertProfileResponse.fromJson(value.data);
        if (details.success ?? false) {
          profile.value = details.data ?? ExpertProfileData();
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
}
