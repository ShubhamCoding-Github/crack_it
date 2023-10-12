import 'package:crack_it_user/backend/api_end_points.dart';
import 'package:crack_it_user/backend/base_api.dart';
import 'package:crack_it_user/base_controller.dart';
import 'package:crack_it_user/response_modal/booking_detail_modal.dart';
import 'package:crack_it_user/response_modal/booking_list_modal.dart';
import 'package:crack_it_user/response_modal/common_response_modal.dart';
import 'package:get/get.dart';

import '../../../storage/base_overlays.dart';

class DashBoardController extends GetxController{
 RxInt selectedTabIndex=0.obs;
 RxList<BookingData> list=<BookingData>[].obs;
 Rx<SingleData> data=SingleData().obs;

  Future<void>getBookingList()async{
    list.clear();
    Map<String,dynamic> param={
      "tabStatus":selectedTabIndex.value==0?"New":selectedTabIndex.value==1?"Upcomming":"past",
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

  Future<void>getBookingDetails({required String id})async{
    data.value=SingleData();
    await BaseAPI().get(url:ApiEndPoints.getSingleBooking+id).then((value){
      if(value!=null){
        BookingDetailResponse details=BookingDetailResponse.fromJson(value.data);
        data.value=details.data??SingleData();
      }
    });
  }

 Future<void> cancelBooking({required String id}) async {
     BaseAPI().put(url: ApiEndPoints.cancelBooking+id,data: data).then((value){
       if (value!=null) {
        CommonResponse response = CommonResponse.fromJson(value.data);
        if(response.success??false){
          BaseOverlays().showSnackBar(message: response.message??"", title: "Success");
          getBookingList();
        }else{
          BaseOverlays().showSnackBar(message: response.message??"", title: "Error");
        }
       }
     });
 }

 Future<void> acceptBooking({required String id}) async {
   BaseAPI().put(url: ApiEndPoints.acceptBooking+id,data: data).then((value){
     if (value!=null) {
       CommonResponse response = CommonResponse.fromJson(value.data);
       if(response.success??false){
         BaseOverlays().showSnackBar(message: response.message??"", title: "Success");
         getBookingList();
       }else{
         BaseOverlays().showSnackBar(message: response.message??"", title: "Error");
       }
     }
   });
 }
}