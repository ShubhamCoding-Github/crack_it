import 'package:crack_it_user/backend/api_end_points.dart';
import 'package:crack_it_user/backend/base_api.dart';
import 'package:crack_it_user/base_controller.dart';
import 'package:crack_it_user/response_modal/common_response_modal.dart';
import 'package:crack_it_user/response_modal/payments_response_modal.dart';
import 'package:crack_it_user/storage/base_overlays.dart';
import 'package:get/get.dart';

class WalletController extends GetxController{
  RxString walletAmount='0'.obs;
  RxList<Payment> list=<Payment>[].obs;

  @override
  void onInit() {
    print('ControllerTwo onInit');
    super.onInit();
  }

  Future<void>getWalletBalance()async{
    String userId=Get.find<BaseController>().user?.sId??'';
    await BaseAPI().get(url:ApiEndPoints.getWallet+userId).then((value) {
      if(value!=null){
        CommonResponse response=CommonResponse.fromJson(value.data);
        if(response.success??false){
          walletAmount.value=response.data['amount']!=null?response.data['amount'].toString():'0';
        }else{
          BaseOverlays().showSnackBar(message:response.message??'',title: 'Error');
        }
      }
    });
  }

  Future<void>getPayments()async{
    list.clear();
    await BaseAPI().get(url:ApiEndPoints.getPayments).then((value) {
      if(value!=null){
        PaymentsListResponse response=PaymentsListResponse.fromJson(value.data);
        if(response.success??false){
           list.value=response.data??[];
        }else{
          BaseOverlays().showSnackBar(message:response.message??'',title: 'Error');
        }
      }
    });
  }
}