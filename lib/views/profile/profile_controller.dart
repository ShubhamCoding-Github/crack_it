import 'package:get/get.dart';

import '../../backend/api_end_points.dart';
import '../../backend/base_api.dart';
import '../../response_modal/profile_response_modal.dart';
import '../../storage/base_overlays.dart';

class ProfileController extends GetxController {
  Rx<ProfileData> profile = ProfileData().obs;

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
}
