import 'package:get/get.dart';

import '../../backend/api_end_points.dart';
import '../../backend/base_api.dart';
import '../../response_modal/common_response_modal.dart';
import '../../storage/base_overlays.dart';

class AddBankController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> postProfileDetails({required Map param}) async {
    await BaseAPI()
        .post(url: ApiEndPoints.addBankDetails, data: param)
        .then((value) {
      if (value != null) {
        CommonResponse response = CommonResponse.fromJson(value.data);
        if (response.success ?? false) {
          BaseOverlays()
              .showSnackBar(message: response.message ?? '', title: "Success");
        } else {
          BaseOverlays()
              .showSnackBar(message: response.message ?? '', title: "Error");
        }
      }
    });
  }
}
